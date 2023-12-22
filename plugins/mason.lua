-- :e 重新加载语言分析服务
-- :LSPInstall lua_ls
-- customize mason plugins
local user_utils = require("user.utils.utils")
local utils = require("astronvim.utils")
return {
	{
		-- This is needed for pylint to work in a virtualenv. See https://github.com/williamboman/mason.nvim/issues/668#issuecomment-1320859097
		"williamboman/mason.nvim",
	},
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			-- NOTE: https://github.com/antonk52/cssmodules-language-server
			opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
				-- "cssmodules_ls",
				-- "emmet_language_server",
				-- "lua_ls",
				-- "tsserver",
				-- "tailwindcss",
				-- "bashls",
				-- "cssls",
				-- "dockerls",
				-- "emmet_ls",
				-- "html",
				-- "jsonls",
				-- "marksman",
				-- "sqlls",
				-- "sqls",
				-- "pyright",
				-- "rust_analyzer",
				-- "taplo",
				-- "yamlls",
			})
			opts.ensure_installed = user_utils.list_remove_unique(opts.ensure_installed, { "emmet_ls" })
		end,
	},
	-- :NullLSInstall stylua
	-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			-- add more things to the ensure_installed table protecting against community packs modifying it
			opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
				-- "prettier",
    -- "sqlfmt",
    -- "mdformat",
    -- "ast-grep ast_grep",
    -- "beautysh",
    -- "blackd-client",
    -- "gofumpt",
    -- "goimports",
    -- "stylua",
				--
				--
				-- "stylua",
			})
		end,
	},
	-- :DapInstall python
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			-- add more things to the ensure_installed table protecting against community packs modifying it
			opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
				-- "python",
				-- "debugpy",
				-- "delve",
				-- "js-debug-adapter",
				--
				--
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function(_, opts)
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dapui.setup(opts)
		end,
	},
}
