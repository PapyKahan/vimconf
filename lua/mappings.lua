local map = vim.api.nvim_set_keymap

-------------------------------------------------------------------
-- Map leader
-------------------------------------------------------------------
vim.g.mapleader = ' '

-------------------------------------------------------------------
-- Better navigation
-------------------------------------------------------------------
map('n', "<C-h>", "<C-w>h", {silent = true, noremap = true})
map('n', "<C-j>", "<C-w>j", {silent = true, noremap = true})
map('n', "<C-k>", "<C-w>k", {silent = true, noremap = true})
map('n', "<C-l>", "<C-w>l", {silent = true, noremap = true})

map('n', "<C-Up>", ":resize -2<cr>", {silent = true, noremap = true})
map('n', "<C-Down>", ":resize +2<cr>", {silent = true, noremap = true})
map('n', "<C-Left>", ":vertical resize -2<cr>", {silent = true, noremap = true})
map('n', "<C-Right>", ":vertical resize +2<cr>", {silent = true, noremap = true})

map('n', "<S-l>", ":bn<cr>", {silent = true, noremap = true})
map('n', "<S-h>", ":bp<cr>", {silent = true, noremap = true})

-------------------------------------------------------------------
-- dap
-------------------------------------------------------------------
map('n', "<leader>dn", ":lua require('dap-python').test_method()<CR>", {silent = true, noremap = true})
map('n', "<leader>df", ":lua require('dap-python').test_class()<CR>", {silent = true, noremap = true})
map('n', "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>", {silent = true, noremap = true})

map('n', "<F5>", "<Cmd>lua require'dap'.continue()<CR>", {silent = true, noremap = true})
map('n', "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true})
map('n', "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", {silent = true, noremap = true})
map('n', "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", {silent = true, noremap = true})
map('n', "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true, noremap = true})
map('n', "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {silent = true, noremap = true})
map('n', "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {silent = true, noremap = true})
map('n', "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", {silent = true, noremap = true})
map('n', "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", {silent = true, noremap = true})


-------------------------------------------------------------------
-- nvim-tree
-------------------------------------------------------------------
map("n", "<C-n>", ":NvimTreeToggle<CR>", {silent = true, noremap = true})


-------------------------------------------------------------------
-- Coc
-------------------------------------------------------------------
local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

function _G.smart_tab()
    if vim.fn.pumvisible() > 0 then
        return vim.api.nvim_replace_termcodes('<C-n>', true, false, true)
    elseif check_back_space() then
        return vim.api.nvim_replace_termcodes('<TAB>', true, false, true)
    else
        return vim.fn['coc#refresh']()
    end
end

map("i", "<Tab>", "v:lua.smart_tab()", {expr = true, noremap = true})
map("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true, noremap = true})
map("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
map('i', '<cr>', 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', { silent = true, expr = true, noremap = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map("n", "[g", "<Plug>(coc-diagnostic-prev)", { noremap = false})
map("n", "g]", "<Plug>(coc-diagnostic-next)", { noremap = false})

-- GoTo code navigation.
map('n', 'gd', "<Plug>(coc-definition)", { noremap = false })
map('n', 'gy', "<Plug>(coc-type-definition)", { noremap = false })
map('n', 'gi', "<Plug>(coc-implementation)", { noremap = false })
map('n', 'gr', "<Plug>(coc-references)", { noremap = false })

function _G.show_documentation()
    if vim.fn['CocAction']('hasProvider', 'hover') then
        return vim.fn['CocActionAsync']('doHover')
    else
        return vim.fn['feedkeys']('K', 'in')
    end
end

-- Use K to show documentation in preview window.
map('n', 'K', "v:lua.show_documentation()", { noremap = true, expr = true, silent = true })


-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_autocmd('CursorHold', {
    pattern = '*',
    command = "call CocActionAsync('highlight')"
})

-- Symbol renaming.
map('n', '<leader>rn', "<Plug>(coc-rename)", { noremap = false })

-- Formatting selected code.
map('x', '<leader>f', "<Plug>(coc-format-selected)", { noremap = false })
map('n', '<leader>f', "<Plug>(coc-format-selected)", { noremap = false })


-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
map('x', '<leader>a', "<Plug>(coc-codeaction-selected)", { noremap = false })
map('n', '<leader>a', "<Plug>(coc-codeaction-selected)", { noremap = false })

-- Remap keys for applying codeAction to the current buffer.
map('n', '<leader>ac', "<Plug>(coc-codeaction)", { noremap = false })
-- Apply AutoFix to problem on the current line.
map('n', '<leader>qf', "<Plug>(coc-fix-current)", { noremap = false })

-- Run the Code Lens action on the current line.
map('n', '<leader>cl', "<Plug>(coc-codelens-action)", { noremap = false })

-------------------------------------------------------------------
-- Telescope
-------------------------------------------------------------------

map('n', '<leader>p', ":Telescope<cr>", { silent = true, noremap = false })
