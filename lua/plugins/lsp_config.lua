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
				"sqls",
				"bashls",
				"clangd",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
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
				vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
				vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

				vim.keymap.set("n", "<leader>e", vim.diagnostic.setloclist, opts)
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

			lspconfig.sqls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					sqls = {
						connections = {
							--[[ { ]]
							--[[   driver = "mysql", ]]
							--[[   dataSourceName = "user:password@tcp(localhost:3307)/mydatabase", ]]
							--[[   name = "MySQL Connection", ]]
							--[[ }, ]]
							--[[ { ]]
							--[[   driver = "postgres", ]]
							--[[   dataSourceName = "postgres://user:password@localhost:5433/mydatabase?sslmode=disable", ]]
							--[[   name = "PostgreSQL Connection", ]]
							--[[ }, ]]
						},
					},
				},
			})

			lspconfig.bashls.setup({})

			lspconfig.clangd.setup({
				cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
				init_options = {
					fallbackFlags = { "-std=c++17" },
				},
				filetypes = { "c", "cpp", "cxx", "cc" },
				root_dir = function()
					vim.fn.getcwd()
				end,
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}
