return {
	{ import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
	{
		-- persistent-breakpoints 是 Neovim 的一个 lua 插件
		-- ，用于将 nvim-dap 的检查点保存到文件中，并在打开 neovim 时自动加载它们。
		-- 它基于此处的代码，但具有更好的性能，并且修复了一些错误。
		"Weissle/persistent-breakpoints.nvim",
		keys = function()
			return {}
		end,
	},
	{ import = "astrocommunity.debugging.nvim-dap-virtual-text" },
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {
			virt_text_pos = "eol",
		},
	},
}
