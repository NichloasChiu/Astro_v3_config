return {
	-- neoconf.nvim 是一个 Neovim 插件，用于管理全局和项目本地设置。
	"folke/neoconf.nvim",
	opts = function(_, opts)
		return require("astronvim.utils").extend_tbl(opts, {
			import = {
				vscode = true,
				coc = false,
				nlsp = true,
			},
		})
	end,
}
