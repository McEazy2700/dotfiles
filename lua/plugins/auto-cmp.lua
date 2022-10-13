local mstats, mason = pcall(require, 'mason')
local mlspstats, mason_lsp = pcall(require, 'mason-lspconfig')
if not mstats then
  print('Mason.nvim is not installed')
elseif not mlspstats then
  print('mason-lspconfig is not installed')
  return
end
mason.setup()
mason_lsp.setup()


vim.cmd [[
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
]]

local kind_icons = {
  Class = "ﴯ",
  Color = "",
  Constant = "",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "",
  Function = "",
  Interface = "",
  Keyword = "",
  Method = "",
  Module = "",
  Operator = "",
  Property = "ﰠ",
  Reference = "",
  Snippet = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "",
}
