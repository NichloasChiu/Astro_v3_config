local utils = require "astronvim.utils"
local is_available = utils.is_available
local augroup = vim.api.nvim_create_augroup

-- Turn off paste mode when leaving insert mode
-- 离开插入模式时关闭粘贴模式
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

if vim.g.neovide then
  local neovide = require "user.utils.neovide"
  neovide.init()
end

-- 自动追踪上个文件  重新会话
-- if is_available "resession.nvim" then
--   local resession = require "resession"
--
--   vim.api.nvim_create_autocmd("VimEnter", {
--     desc = "Restore session on open",
--     group = augroup("resession_auto_open", { clear = true }),
--     callback = function()
--       -- Only load the session if nvim was started with no args
--       if vim.fn.argc(-1) == 0 then
--         -- Save these to a different directory, so our manual sessions don't get polluted
--         resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
--       end
--     end,
--   })
-- end

if is_available "venv-selector.nvim" then
  vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Auto select virtualenv Nvim open",
    pattern = "*",
    callback = function()
      local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
      if venv ~= "" then require("venv-selector").retrieve_from_cache() end
    end,
    once = true,
  })
end

-- vim.api.nvim_create_user_command("MyLazyGit", require("user.utils.utils").toggle_lazy_git(), {})



-- 自动添加头批注
vim.cmd [[
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.go exec ":call SetTitle()"
"""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."),"\###########################################################################################################")
        call append(line(".")+1,   "\# File Name:    ".expand("%"))
        call append(line(".")+2, "\# Author:       NichloasChiu")
        call append(line(".")+3, "\# mail:         NichloasChiu@outlook.com")
        call append(line(".")+4, "\# Created Time: ".strftime("%c"))
        call append(line(".")+5, "\##########################################################################################################")
        call append(line(".")+6, "")
    else
        call setline(1, "/* ************************************************************************")
        call append(line("."),   "> File Name:     ".expand("%"))
        call append(line(".")+1, "> Author:        NichloasChiu")
        call append(line(".")+2, "> mail:          NichloasChiu@outlook.com")
        call append(line(".")+3, "> Created Time:  ".strftime("%c"))
        call append(line(".")+4, "> Description:   ")
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
]]

vim.cmd [[
autocmd BufNewFile *.h,*.hpp exec ":call AddHHeader()"
func AddHHeader()
    let macro = "_".toupper(substitute(expand("%"), "[/.]", "_", "g"))."_"
    "normal o
    call setline(9, "#ifndef ".macro)
    call setline(10, "#define ".macro)
    call setline(11, "")
    call setline(12, "#endif  // ".macro)
endfunc
]]

-- 保存指针位置
vim.cmd [[
  if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g'\"" |
  \ endif
  endif
]]

--保存自动格式化
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
