return {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    init = function ()
        if vim.env['LSP_LANGUAGE_SERVERS'] then
            vim.g.codeium_no_map_tab = true
            vim.g.codeium_bin = "C:\\ieu\\tools\\codeium\\bin\\language_server_windows_x64.exe"
            vim.g.codeium_os = "Windows"
            vim.g.codeium_arch = "x86_64"
        end
    end,
    keys = {
        { "<M-i>", function() return vim.fn['codeium#Accept']() end,             mode = { "i" }, remap = true, expr = true, silent = true },
        { "<M-j>", function() return vim.fn['codeium#CycleCompletions'](1) end,  mode = "i",     remap = true, expr = true, silent = true },
        { "<M-k>", function() return vim.fn['codeium#CycleCompletions'](-1) end, mode = "i",     remap = true, expr = true, silent = true },
        { "<M-l>", function() return vim.fn['codeium#Clear']() end,              mode = { "i" }, remap = true, expr = true, silent = true },
    },
}
