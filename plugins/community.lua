-- User AstroFile : Triggered after opening a file
-- VeryLazy : Triggered after opening a file
-- BufEnter *.lua : Triggered after opening a Lua file
-- InsertEnter : Triggered after entering insert mode
-- LspAttach : Triggered after staring LSPs
-- 打开文件后触发的用户AstroFile。
-- 打开文件后触发的非常懒惰。
-- BufEnter*Lua在打开Lua文件后触发。
-- InsertEnter在进入插入模式后触发。
-- LspAttach在启动LSP后触发。
-- --音符插入模式。
-- 删除前一个字符。
-- 删除以前的字词。
-- 删除到行首(<C-u>)。
-- 本地插件。

-- NOTE: insert mode :
-- <C-h> : delete previous character
-- <C-w> : delete previous word
-- <C-u> : delete to beginning of line
local plugins = {
	"AstroNvim/astrocommunity",
	-- 这个插件限制了hjkl连按次数和鼠标，强制学习vim操作
	-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/workflow/hardtime-nvim/hardtime-nvim.lua
	-- { import = "astrocommunity.workflow.hardtime-nvim" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.vue" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.java" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.completion.cmp-cmdline" },
	{ import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

}

return plugins
