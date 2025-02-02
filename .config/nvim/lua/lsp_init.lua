-- LSP setup
local lspconfig = require("lspconfig")
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    --rename keybindings using nnoremap
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    -- use LSP signature help as you type
    vim.api.nvim_create_autocmd("CursorHoldI", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.signature_help()
        end,
    })
end

-- Setup python using pyright
lspconfig.pyright.setup{
    on_attach = on_atttach,
    flags = {
        allow_incremental_sync = false
    }
}

-- Setup for C++ using clangd
lspconfig.clangd.setup{}

-- Setup efm-langserver for linting & formatting
lspconfig.efm.setup({
    on_attach = on_attach,
    init_optinos = {documentFormatting = true},
    settings = { 
        logLevel = 1,
        rootMarkers = {".git/"},
        languages = {
            python = {
                lintCommand = "pylint --output-format text --score no --msg-temjplate {path}:{line}:{column}:{C}:{msg} ${INPUT}",
                lintStdin = false,
                lintFormats = {'%f:%l:%c:%t:%m'},
                lintOffsetColumns = 1,
                lintCategoryMap = {
                    I = "H",
                    R = "I",
                    C = "I",
                    W = "W",
                    E = "E",
                    F = "E",
                },
            },
            {
                lintCommand = "flake8 --stdin-display-name ${INPUT} -",
                lintIgnoreExitCode = true,
                lintStdin = true,
                lintFormats = {"%s:%l:%c: %m"},
            },
            {
                formatCommand = "black --fast -",
                formatStdin = true,
            },
            {
                formatCommand = "isort --quite -",
                formatStdin = true,
            },
        },
        cpp = {
            {
                formatCommand = "clang-format -style=Google",
                formatStdin = true,
            },
        },
    },
    filetypes = {"python", "cpp"}
})

-- Autocompletion setup
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(arg.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    },
    {
        { name = 'buffer' },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

-- LSP UI enhancements
local saga = require('lspsaga')
saga.setup({
    border_style = "round"
})
local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
    ensure_installed = { "c", "cpp", "python", "markdown", "bash", "lua", "vim" }, -- install language parsers.
    highlight = {
        enable = true,
    },
}

-- git blame setup
local gitblame = require("gitblame")
gitblame.setup({
    enable=true,
    message_template = " <summary> * <date> * <author> * <<sha>>",
    date_format = "%m-%d-%Y %H:%M:%S",
})

-- marksman setup
lspconfig.marksman.setup{}

-- Autocommand to format on save
vim.cmd [[
augroup LspFormatting
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })
augroup END
]]

--Rename command
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap=true, silent=true })
