return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'j-hui/fidget.nvim',
            'williamboman/mason-lspconfig.nvim',

        },
        opts = {
            servers = {}
        },
        config = function(_, opts)
            require 'base.lsp.mappings'.setup()
            require 'base.lsp.handlers'.setup()
            require 'base.lsp.diagnostic'.setup()
            require 'base.lsp.config'.setup(_, opts)
        end
    },
    {
        'williamboman/mason.nvim',
        event = 'VeryLazy',
        config = function()
            local options = {
                ui = {
                    border = "rounded"
                },
                automatic_installation = true,
                max_concurrent_installers = 10,
            }
            if vim.env['LSP_LANGUAGE_SERVERS'] then
                options.install_root_dir = vim.env['LSP_LANGUAGE_SERVERS']
            end
            require('mason').setup(options)
        end
    },
    -- Lsp Progress bar
    {
        'j-hui/fidget.nvim',
        config = function()
            require 'fidget'.setup {
                text = {
                    spinner = 'circle_halves'
                }
            }
        end
    },
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            local diagnostic_signs = require 'base.ui.icons'.diagnostic_signs
            require('trouble').setup {
                signs = {
                    error = diagnostic_signs.Error,
                    warning = diagnostic_signs.Warn,
                    hint = diagnostic_signs.Hint,
                    information = diagnostic_signs.Info,
                    other = diagnostic_signs.Other,
                },
            }
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        event = "VeryLazy",
        config = function() require("symbols-outline").setup() end
    },
}
