local loaded, _ = pcall(require, "impatient")
if loaded then
    require'impatient'
end

require'usr.plugins'
require'usr.options'
require'usr.mappings'
require'usr.lsp'
require'usr.dap'
