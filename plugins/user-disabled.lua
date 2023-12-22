return {
	-- 这个插件是 better_escape.vim 的 lua 版本， 具有一些附加功能和优化
  -- 很多人都有映射，例如或转义插入模式。 这种映射的问题在于，每当您键入 a 时，
  -- neovim 都会等待大约 100-500 毫秒（取决于您的超时）才能查看是否键入 a 或 a，
  -- 因为这些映射已映射。 只有在该时间之后，才会插入。 然后，在键入 .jkjjjjkjj
	-- { "max397574/better-escape.nvim", enabled = true },
	{ "rcarriga/nvim-notify", opts = { timeout = 0, background_colour = "#000000" } },
}
