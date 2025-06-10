return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"eslint",
				"pylsp",
				"cssls",
				"gopls",
				"templ",
				"html",
				"tailwindcss",
				"intelephense",
				"hyprls",
				"dockerls",
				"docker_compose_language_service",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, _)
				local opts = {}

				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<S-k>", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>ge", vim.diagnostic.open_float, opts)
			end

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

			lspconfig.dockerls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.docker_compose_language_service.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}
