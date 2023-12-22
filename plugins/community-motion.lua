-- TODO: check keys
return {
	{ import = "astrocommunity.motion.nvim-surround" },
	{ import = "astrocommunity.motion.flash-nvim" },
	{
		-- 允许使用搜索标签浏览代码， 增强了角色动作和 Treesitter 集成。
		"folke/flash.nvim",
		keys = function()
			return {}
		end,
	},
	{ import = "astrocommunity.motion.marks-nvim" },
	{
		"chentoast/marks.nvim",
		opts = {
			default_mappings = false,
		},
	},
}
