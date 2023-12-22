-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
-- -- 此函数最后运行，是配置的好地方
-- augroups/autocommands 和自定义文件类型也只是纯粹的 lua 所以
-- 任何不适合上述正常配置位置的内容都可以转到此处
return function()
	-- Set up custom filetypes
	-- vim.filetype.add {
	--   extension = {
	--     foo = "fooscript",
	--   },
	--   filename = {
	--     ["Foofile"] = "fooscript",
	--   },
	--   pattern = {
	--     ["~/%.config/foo/.*"] = "fooscript",
	--   },

	--
	require("user.autocmds")
end
