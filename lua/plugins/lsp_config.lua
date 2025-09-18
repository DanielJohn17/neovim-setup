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

			vim.lsp.config["lua_ls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["ts_ls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["eslint"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["vimls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["pslsp"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["cssls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["gopls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["templ"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["html"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["tailwindcss"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["intelephense"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["hyprls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["dockerls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["docker_compose_language_service"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config["sqls"] = {
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
			}

			vim.lsp.config["bashls"] = {}

			vim.lsp.config["clangd"] = {
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
			}
		end,
	},
}
