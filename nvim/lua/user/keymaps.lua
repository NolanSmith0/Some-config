local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- window control
-- 取消 s 默认功能
keymap("n", "s", "", opts)
-- windows 分屏快捷键
keymap("n", "sv", ":vsp<CR>", opts)
keymap("n", "sh", ":sp<CR>", opts)
-- 关闭当前
keymap("n", "sc", "<C-w>c", opts)
-- 关闭其他
keymap("n", "so", "<C-w>o", opts)
-- Alt + hjkl  窗口之间跳转
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
-- 左右比例控制
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "s,", ":vertical resize -20<CR>", opts)
keymap("n", "s.", ":vertical resize +20<CR>", opts)
-- 上下比例
keymap("n", "sj", ":resize +10<CR>", opts)
keymap("n", "sk", ":resize -10<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- 等比例
keymap("n", "s=", "<C-w>=", opts)

-- Normal --

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- 退出
keymap("n", "q", ":q<CR>", opts)
keymap("n", "qq", ":q!<CR>", opts)
keymap("n", "Q", ":qa!<CR>", opts)

-- bufferline
-- 左右Tab切换
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
-- 关闭
--"moll/vim-bbye"
keymap("n", "<C-w>", ":Bdelete!<CR>", opts)
keymap("n", "<leader>bl", ":BufferLineCloseRight<CR>", opts)
keymap("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opts)
keymap("n", "<leader>bc", ":BufferLinePickClose<CR>",opts)

-- Telescope
-- 查找文件
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
-- 全局搜索
keymap("n", "<C-f>", ":Telescope live_grep<CR>", opts)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
keymap("n", "<A-m>", ":NvimTreeToggle<CR>", opts)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys
