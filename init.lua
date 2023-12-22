return {
	mappings = function(maps)
		return require("user.keymaps").mappings(maps)
	end,
	diagnostics = {
		update_in_insert = false,
		virtual_text = { severity = { min = vim.diagnostic.severity.WARN } },
		underline = true,
		signs = { severity = { min = vim.diagnostic.severity.WARN } },
	},
	lazy = {
		defaults = { lazy = true },
		performance = {
			rtp = {
				-- customize default disabled vim plugins
				-- 自定义默认禁用的 Vim 插件
				disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
			},
		},
	},
	lsp = {
		-- 启用您已经安装的服务器，但没有 Mason
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright",
			-- "lua",
			-- "bash",
			-- "sql",
		},
	},
	-- 添加新的用户界面图标
	-- add new user interface icon
	-- icons = {
	-- 	VimIcon = "",
	-- 	ScrollText = "",
	-- 	GitBranch = "",
	-- 	GitAdd = "",
	-- 	GitChange = "",
	-- 	GitDelete = "",
	-- },
	-- 修改 使用但未直接在 setup 调用中定义的变量
	-- modify variables used by heirline but not defined in the setup call directly
	-- heirline = {
	-- 	-- define the separators between each section
	-- 	-- 定义每个部分之间的分隔符
	-- 	separators = {
	-- 		left = { "", " " }, -- separator for the left side of the statusline
	-- 		right = { " ", "" }, -- separator for the right side of the statusline
	-- 		tab = { "", "" },
	-- 	},
	-- 	-- add new colors that can be used by heirline
	-- 	-- 添加继承人可以使用的新颜色
	-- 	colors = function(hl)
	-- 		local get_hlgroup = require("astronvim.utils").get_hlgroup
	-- 		-- use helper function to get highlight group properties
	-- 		local comment_fg = get_hlgroup("Comment").fg
	-- 		hl.git_branch_fg = comment_fg
	-- 		hl.git_added = comment_fg
	-- 		hl.git_changed = comment_fg
	-- 		hl.git_removed = comment_fg
	-- 		hl.blank_bg = get_hlgroup("Folded").fg
	-- 		hl.file_info_bg = get_hlgroup("Visual").bg
	-- 		hl.nav_icon_bg = get_hlgroup("String").fg
	-- 		hl.nav_fg = hl.nav_icon_bg
	-- 		hl.folder_icon_bg = get_hlgroup("Error").fg
	-- 		return hl
	-- 	end,
	-- 	attributes = {
	-- 		mode = { bold = true },
	-- 	},
	-- 	icon_highlights = {
	-- 		file_icon = {
	-- 			statusline = false,
	-- 		},
	-- 	},
	-- },
	-- highlights = {
	-- 	-- 为所有主题设置亮点
	-- 	-- 使用函数覆盖让我们使用 Lua 从高亮组中检索颜色
	-- 	-- 没有默认的表，所以我们不需要为这个函数放一个参数
	-- 	-- set highlights for all themes
	-- 	-- use a function override to let us use lua to retrieve colors from highlight group
	-- 	-- there is no default table so we don't need to put a parameter for this function
	-- 	init = function()
	-- 		local get_hlgroup = require("astronvim.utils").get_hlgroup
	-- 		-- get highlights from highlight groups
	-- 		local normal = get_hlgroup("Normal")
	-- 		local fg, bg = normal.fg, normal.bg
	-- 		local bg_alt = get_hlgroup("Visual").bg
	-- 		local green = get_hlgroup("String").fg
	-- 		local red = get_hlgroup("Error").fg
	-- 		-- return a table of highlights for telescope based on colors gotten from highlight groups
	-- 		return {
	-- 			TelescopeBorder = { fg = bg_alt, bg = bg },
	-- 			TelescopeNormal = { bg = bg },
	-- 			TelescopePreviewBorder = { fg = bg, bg = bg },
	-- 			TelescopePreviewNormal = { bg = bg },
	-- 			TelescopePreviewTitle = { fg = bg, bg = green },
	-- 			TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
	-- 			TelescopePromptNormal = { fg = fg, bg = bg_alt },
	-- 			TelescopePromptPrefix = { fg = red, bg = bg_alt },
	-- 			TelescopePromptTitle = { fg = bg, bg = red },
	-- 			TelescopeResultsBorder = { fg = bg, bg = bg },
	-- 			TelescopeResultsNormal = { bg = bg },
	-- 			TelescopeResultsTitle = { fg = bg, bg = bg },
	-- 		}
	-- 	end,
	-- },
}
