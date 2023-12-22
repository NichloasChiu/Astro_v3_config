return {
  format_on_save = {
    -- enable or disable format on save globally
    -- 启用或禁用全局保存时的格式
    enabled = true, 
    -- enable format on save for specified filetypes only
    -- 仅在保存时为指定的文件类型启用格式化
    allow_filetypes = { 
      "python",
      "bash",
      "sql",
      "java",
      "go",
      "lua",
    },
    -- disable format on save for specified filetypes
    -- 在保存指定文件类型时禁用格式
    ignore_filetypes = { 
      -- "python",
    },
  },
  -- disable formatting capabilities for the listed language servers
  -- 禁用所列语言服务器的格式化功能
  disabled = { 
    -- "lua_ls",
  },
  -- default format timeout
  -- 默认格式超时
  timeout_ms = 10000, 
  -- filter = function(client) -- fully override the default formatting function
  -- 完全覆盖默认格式化函数
  --   return true
  -- end
}
