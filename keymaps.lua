-- o 是运算符挂起模式
-- x 是可视模式
local M = {}

function M.mappings(maps)
	-- 使用 vim.keymap.set（） 直接存储的 “desc” 映射数据。
	--
	-- 请使用此映射表来设置键盘映射，因为这是
	-- 较低级别的配置和更健壮的配置。（which-key 将
	-- 通过此设置自动拾取存储的数据。
	local utils = require("astronvim.utils")
	local is_available = utils.is_available
	local my_utils = require("user.utils.utils")

	-- print(require("astronvim.utils").is_available "venv-selector.nvim")
	-- print(vim.fn.has "unix" == 1)
	local system = vim.loop.os_uname().sysname

	-- 更好的搜索
	maps.n["n"] = { my_utils.better_search("n"), desc = "Next search" }
	maps.n["N"] = { my_utils.better_search("N"), desc = "Previous search" }

	-- 行级上下移动
	maps.v["K"] = { ":move '<-2<CR>gv-gv", desc = "Move line up", silent = true }
	maps.v["J"] = { ":move '>+1<CR>gv-gv", desc = "Move line down", silent = true }

	-- 全选
	maps.n["<C-a>"] = { "gg<S-v>G", desc = "Select all" }

	-- i 模式下保存
	maps.i["<C-s>"] = { "<esc>:w<cr>a", desc = "Save file", silent = true }

	if is_available("nvim-dap-ui") then
		maps.n["<leader>dU"] = {
			function()
				require("dapui").toggle({ reset = true })
			end,
			desc = "切换调试器 UI 并重置布局",
			-- desc = "Toggle Debugger UI and reset layout",
		}
		if is_available("persistent-breakpoints.nvim") then
			maps.n["<F9>"] = {
				function()
					require("persistent-breakpoints.api").toggle_breakpoint()
				end,
				desc = "调试器：切换断点",
				-- desc = "Debugger: Toggle Breakpoint",
			}
			maps.n["<leader>db"] = {
				function()
					require("persistent-breakpoints.api").toggle_breakpoint()
				end,
				desc = "切换断点(F9)",
				-- desc = "Toggle Breakpoint (F9)",
			}
			maps.n["<leader>dB"] = {
				function()
					require("persistent-breakpoints.api").clear_all_breakpoints()
				end,
				desc = "清除所有断点",
				-- desc = "Clear All Breakpoints",
			}
			maps.n["<leader>dC"] = {
				function()
					require("persistent-breakpoints.api").set_conditional_breakpoint()
				end,
				desc = "条件断点(S-F9)",
				-- desc = "Conditional Breakpoint (S-F9)",
			}
			maps.n["<F21>"] = {
				function()
					require("persistent-breakpoints.api").set_conditional_breakpoint()
				end,
				desc = "条件断点(S-F9)",
				-- desc = "Conditional Breakpoint (S-F9)",
			}
		end
	end

	-- CmdLine  Ui界面
	if is_available("noice.nvim") then
		local noice_down = function()
			if not require("noice.lsp").scroll(4) then
				return "<C-d>"
			end
		end
		local noice_up = function()
			if not require("noice.lsp").scroll(-4) then
				return "<C-u>"
			end
		end

		maps.n["<C-d>"] = {
			noice_down,
			desc = "向下滚动",
			-- desc = "Scroll down",
			silent = true,
			expr = true,
		}
		maps.i["<C-d>"] = {
			noice_down,
			desc = "向下滚动",
			-- desc = "Scroll down",
			silent = true,
			expr = true,
		}
		maps.s["<C-d>"] = {
			noice_down,
			desc = "向下滚动",
			-- desc = "Scroll down",
			silent = true,
			expr = true,
		}
		maps.n["<C-u>"] = {
			noice_up,
			desc = "向上滚动",
			-- desc = "Scroll down",
			silent = true,
			expr = true,
		}
		maps.i["<C-u>"] = {
			noice_up,
			desc = "向上滚动",
			-- desc = "Scroll down",
			silent = true,
			expr = true,
		}
		maps.s["<C-u>"] = {
			noice_up,
			desc = "向上滚动",
			-- desc = "Scroll down",
			silent = true,
			expr = true,
		}
	end

	-- 此插件将查找靠近代码的 python 虚拟环境。
	if is_available("venv-selector.nvim") then
		maps.n["<leader>lv"] = {
			"<cmd>VenvSelect<CR>",
			desc = "Select VirtualEnv",
		}
		maps.n["<leader>lV"] = {
			function()
				require("astronvim.utils").notify(
					"Current Env:" .. require("venv-selector").get_active_venv(),
					vim.log.levels.INFO
				)
			end,
			desc = "Show Current VirtualEnv",
		}
	end

	if is_available("marks.nvim") then
		-- 标志
		maps.n["m"] = { desc = "Marks" }
		maps.n["m,"] = { "<Plug>(Marks-setnext)<CR>", desc = "Set Next Lowercase Mark" }
		maps.n["m;"] = { "<Plug>(Marks-toggle)<CR>", desc = "Toggle Mark(Set Or Cancel Mark)" }
		maps.n["m]"] = { "<Plug>(Marks-next)<CR>", desc = "Move To Next Mark" }
		maps.n["m["] = { "<Plug>(Marks-prev)<CR>", desc = "Move To Previous Mark" }
		maps.n["m:"] = { "<Plug>(Marks-preview)", desc = "Preview Mark" }

		maps.n["dm"] = { "<Plug>(Marks-delete)", desc = "Delete Marks" }
		maps.n["dm-"] = { "<Plug>(Marks-deleteline)<CR>", desc = "Delete All Marks On The Current Line" }
		maps.n["dm<space>"] = { "<Plug>(Marks-deletebuf)<CR>", desc = "Delete All Marks On Current Buffer" }
	end

	-- 关闭搜索高亮
	-- maps.n["<leader>nh"] = { ":nohlsearch<CR>", desc = "Close search highlight" }

	maps.n["<leader><leader>"] = { desc = "󰍉 User" }
	maps.n["s"] = "<Nop>"
	maps.n["<leader><leader>e"] = { "<cmd>e ++enc=cp936<cr>", desc = "Sql乱码修正" }
	maps.n["<leader><leader>m"] = { "<cmd>MarkdownPreviewStop<cr> | <cmd>MarkdownPreview<cr>", desc = "MarkDown预览" }
	maps.n["<leader><leader>t"] = { "<cmd>TableModeToggle<cr>", desc = "MarkDown表模式" }

	maps.n["<leader>a"] = { desc = "󱂬 Move Ducument" }
	maps.n["<leader>aw"] = { "<cmd>cd /mnt/c/Working Document<cr> | <cmd>Neotree<cr>", desc = "Move WorkingDucument" }
	maps.n["<leader>ad"] = { "<cmd>cd /mnt/c/Users/Zhaoning/Desktop/<cr> | <cmd>Neotree<cr>", desc = "Move Desktop" }
	maps.n["<leader>an"] = { "<cmd>cd ~/.config/nvim/lua/user/<cr> | <cmd>Neotree<cr>", desc = "Move Nvim Configuration" }
	-- maps.n["<leader>aw"] = { "<cmd>cd /mnt/d/Working Document/<cr> | <cmd>Neotree<cr>", desc = "Move WorkingDucument" }
	-- maps.n["<leader>ad"] = { "<cmd>cd /mnt/d/Users/Desktop/<cr> | <cmd>Neotree<cr>", desc = "Move Desktop" }
	-- maps.n["<leader>an"] = { "<cmd>cd ~/.config/nvim/lua/user/<cr> | <cmd>Neotree<cr>", desc = "Move Nvim Configuration" }


	-- 关闭 Mason
	if is_available("refactoring.nvim") then
		maps.n["<leader>r"] = { desc = " Refactor" }
		maps.v["<leader>r"] = { desc = " Refactor" }
	end

	--  HL行首尾移动
	maps.n["H"] = { "^", desc = "Go to start without blank" }
	maps.n["L"] = { "$", desc = "Go to end without blank" }
	maps.i["C-l"] = { "<Esc>A", desc = "Go to start without blank" }
	maps.i["C-h"] = { "<Esc>I", desc = "Go to end without blank" }

	if is_available("vim-visual-multi") then
		-- visual multi
		-- 它被称为 vim-visual-multi 类似于 visual-block，但该插件主要在正常模式下工作。选择单词
		vim.g.VM_maps = {
			["Find Under"] = "<C-n>",
			["Find Subword Under"] = "<C-n>",
			["Add Cursor Up"] = "<C-S-k>",
			["Add Cursor Down"] = "<C-S-j>",
			["Select All"] = "<C-S-n>",
			["Skip Region"] = "<C-x>",
		}
	end

	-- telescope plugin mappings望远镜插件映射
	if is_available("telescope.nvim") then
		maps.v["<leader>f"] = { desc = "󰍉 Find" }
		maps.n["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" }
		-- buffer switching缓冲器切换
		maps.n["<leader>bt"] = {
			function()
				if #vim.t.bufs > 1 then
					require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })
				else
					utils.notify("No other buffers open")
				end
			end,
			desc = "Switch Buffers In Telescope",
		}
	end

	-- visual模式下缩进代码, 缩进后仍然可以继续选中区域
	maps.v["<"] = { "<gv", desc = "Unindent line" }
	maps.v[">"] = { ">gv", desc = "Indent line" }

	-- 一个 neovim 插件，用于在编辑会话期间保留和切换多个终端
	-- if is_available "toggleterm.nvim" then
	--   if vim.fn.executable "lazygit" == 1 then
	--     maps.n["<leader>gg"] = maps.n["<leader>tl"]
	--     maps.n["<leader>tl"] = {
	--       my_utils.toggle_lazy_git(),
	--       desc = "ToggleTerm lazygit",
	--     }
	--   end
	--   if vim.fn.executable "joshuto" == 1 then
	--     maps.n["<leader>tj"] = {
	--       my_utils.toggle_joshuto(),
	--       desc = "ToggleTerm joshuto",
	--     }
	--   end
	-- end

	-- 在visual mode 里粘贴不要复制
	maps.n["x"] = { '"_x', desc = "Cut without copy" }

	-- 分屏快捷键
	maps.n["<leader>w"] = { desc = "󱂬 Window" }
	maps.n["<leader>ww"] = { "<cmd><cr>", desc = "Save" }
	maps.n["<leader>wc"] = { "<C-w>c", desc = "Close current screen关闭当前屏幕" }
	maps.n["<leader>wo"] = { "<C-w>o", desc = "Close other screen关闭其他屏幕" }
	-- 多个窗口之间跳转
	maps.n["<leader>w="] = { "<C-w>=", desc = "Make all window equal使所有窗口相等" }
	maps.n["<TAB>"] = {
		function()
			require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
		end,
		desc = "Next buffer下一个缓冲区",
	}
	maps.n["<S-TAB>"] = {
		function()
			require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
		end,
		desc = "Previous buffer上一个缓冲区",
	}
	maps.n["<leader>bo"] = {
		function()
			require("astronvim.utils.buffer").close_all(true)
		end,
		-- desc = "关闭除当前缓冲区之外的所有缓冲区" }
		desc = "Close all buffers except current ",
	}
	maps.n["<leader>ba"] = {
		function()
			require("astronvim.utils.buffer").close_all()
		end,
		desc = "Close all buffers",
	}
	maps.n["<leader>bc"] = {
		function()
			require("astronvim.utils.buffer").close()
		end,
		desc = "Close buffer",
	}
	-- desc = "Close buffer" }
	maps.n["<leader>bC"] = {
		function()
			require("astronvim.utils.buffer").close(0, true)
		end,
		desc = "Force close buffer",
	}
	maps.n["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" }
	maps.n["<leader>bD"] = {
		function()
			require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
				require("astronvim.utils.buffer").close(bufnr)
			end)
		end,
		desc = "Pick to close",
	}

	-- lsp restart
	maps.n["<leader>lm"] = { "<Cmd>LspRestart<CR>", desc = "Lsp restart" }
	maps.n["<leader>lg"] = { "<Cmd>LspLog<CR>", desc = "Show lsp log" }

	if is_available("flash.nvim") then
		maps.n["<leader>s"] = {
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		}
		maps.x["<leader>s"] = {
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		}
		maps.o["<leader>s"] = {
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		}
		maps.n["<leader><leader>s"] = {
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		}
		maps.x["<leader><leader>s"] = {
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		}
		maps.o["<leader><leader>s"] = {
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		}
	end

	if is_available("substitute.nvim") then
		-- substitute, 交换和替换插件, 寄存器中的值，将会替换到s位置, s{motion}
		maps.n["s"] = { require("substitute").operator, desc = "Replace with {motion}" }
		maps.n["ss"] = { require("substitute").line, desc = "Replace with line" }
		maps.n["S"] = { require("substitute").eol, desc = "Replace until eol" }
		maps.v["p"] = { require("substitute").visual, desc = "Replace in visual" }
		-- exchange
		maps.n["sx"] = { require("substitute.exchange").operator, desc = "Exchange with {motion}" }
		maps.n["sxx"] = { require("substitute.exchange").line, desc = "Exchange with line" }
		maps.n["sxc"] = { require("substitute.exchange").cancel, desc = "Exchange exchange" }
		maps.v["X"] = { require("substitute.exchange").visual, desc = "Exchange in visual" }
	end

	if is_available("nvim-treesitter") then
		-- TsInformation
		maps.n["<leader>lT"] = { "<cmd>TSInstallInfo<cr>", desc = "Tree sitter Information" }
	end

	-- neoconf.nvim 是一个 Neovim 插件，用于管理全局和项目本地设置。
	if is_available("neoconf.nvim") then
		-- maps.n["<leader>n"] = { desc = " Neoconf" }
		maps.n["<leader>pd"] = { "<cmd>Neoconf<CR>", desc = "Select local/global neoconf config" }
		maps.n["<leader>pb"] = { "<cmd>Neoconf show<CR>", desc = "Show neoconf merge config" }
		maps.n["<leader>pc"] = { "<cmd>Neoconf lsp<CR>", desc = "Show neoconf merge lsp config" }
	end

	return maps
end

return M
