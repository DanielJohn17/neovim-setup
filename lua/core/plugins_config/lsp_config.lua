require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "eslint" },
})

vim.diagnostic.config({
	virtual_text = true, -- Show inline errors
	update_in_insert = true, -- Update diagnostics while typing in insert mode
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
	},
})

local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.vimls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.pylsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.templ.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.hyprls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
