local mason_status, mason = pcall(require, 'mason')
if not mason_status then
  print('Mason.nvim is not installed')
  return
end
local lsp_stats, masonlsp = pcall(require, 'mason-lspconfig')
if not lsp_stats then
  print('mason-lspconfig is not installed')
  return
end

mason.setup()
masonlsp.setup({
  ensure_installed = {
    'pylsp',
  },
  automatic_installation = true,
})
masonlsp.setup_handlers {
  function (server)
    require'lspconfig'[server].setup{}
  end
}
