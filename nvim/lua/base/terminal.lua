return {
    -- Note: Terminal
    {
        'akinsho/nvim-toggleterm.lua',
        event = "VeryLazy",
        branch = 'main',
        dependencies = {
            'folke/which-key.nvim',
        },
        config = function()
            local whichkey = require('which-key')
            whichkey.register({
                name = "Terminal",
                ["<F12>"] = { "<cmd>ToggleTerm<cr>", "Open Terminal" }
            }, {
                mode = "n",
                silent = true,
                noremap = false,
            })

            whichkey.register({
                name = "Terminal",
                ["<F12>"] = { "<cmd>ToggleTerm<cr>", "Open Terminal" }
            }, {
                mode = "t",
                silent = true,
                noremap = false,
            })

            require('toggleterm').setup {
                hide_numbers = true,
                close_on_exit = true,
                float_opts = {
                    -- The border key is *almost* the same as 'nvim_win_open'
                    -- see :h nvim_win_open for details on borders however
                    -- the 'curved' border is a custom border type
                    -- not natively supported but implemented in this plugin.
                    border = 'curved', -- single/double/shadow/curved
                    width = math.floor(0.7 * vim.fn.winwidth(0)),
                    height = math.floor(0.8 * vim.fn.winheight(0)),
                    winblend = 4,
                }
            }
        end
    },
}
