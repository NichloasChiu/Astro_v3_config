-- Configure AstroNvim updates
-- 配置 AstroNvim 更新
return {
  remote = "origin",     -- remote to use远程使用
  channel = "stable",    -- "stable" or "nightly"“稳定”或“最新
  -- “latest”、标签名称或正则表达式搜索（如“v1.*”）仅在 v2 之前进行更新（仅限稳定版）
  version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
  branch = "nightly",    -- branch name (NIGHTLY ONLY)分支名称（仅限 NIGHTLY）
  commit = nil,          -- commit hash (NIGHTLY ONLY)提交哈希值（仅限 NIGHTLY）
  pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable onlAy)（nil 将仅将插件固定在稳定版上）
  skip_prompts = false,  -- skip prompts about breaking changes跳过有关重大更改的提示
  show_changelog = true, -- show the changelog after performing an update执行更新后显示更改日志
  auto_quit = false,     -- automatically quit the current session after a successful update 更新成功后自动退出当前会话
  remotes = {            -- easily add new remotes to track轻松添加要跟踪的新遥控器
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url完整的远程 URL
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,GitHub 用户/存储库快捷方式，
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim forkGitHub 用户假设 AstroNvim fork
  },
}
