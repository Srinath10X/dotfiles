---------------------------
--->  Installing Lazy  <---
---------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Catppuccin colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	{ "projekt0n/github-nvim-theme" },

	{ "bluz71/vim-nightfly-colors" },

	{ "lunarvim/darkplus.nvim" },

	{
		"decaycs/decay.nvim",
	},

	{ "Mofiqul/vscode.nvim" },
	-- Lualine as a status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		-- cheakout :help lualine.txt for info
		opts = {
			options = {
				disabled_filetypes = { "NvimTree" },
				icons_enabled = true,
				theme = "catppuccin",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						icon = "",
						"mode",
						separator = { left = "", right = "" },
						right_padding = 2,
						bg = "#1e2030",
					},
				},
				lualine_b = {
					{ "filetype", icon_only = true },
					{ "filename", color = { fg = "#bcc0cc" } },
					"branch",
				},
				lualine_c = { "fileformat" },
				lualine_x = {},
				lualine_y = { { "filetype", color = { fg = "#bcc0cc" } }, "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		},
	},

	-- Indent blankline
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- Telescope fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
			})
		end,
	},

	-- Nvim filetree
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			-- disable netrw
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			-- setup function
			require("nvim-tree").setup()
		end,
	},

	-- Toggle terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-t>]],
				direction = "float",
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})
		end,
	},

	-- Vim navigator
	{
		"christoomey/vim-tmux-navigator",
	},

	-- Buffer line
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					indicator = { style = "icon", icon = "" },
					buffer_close_icon = "",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					offsets = { { filetype = "NvimTree", text = " 󰉋  Explorer", text_align = "center" } },
					max_name_length = 30,
					max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
					tab_size = 20,
				},
			})
		end,
	},

	-- neovim dash board
	"nvimdev/dashboard-nvim",
	{
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header
			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("e", "  >  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "󰍉  >  Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
				dashboard.button("r", "  >  Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("s", "  >  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
				dashboard.button("q", "󰗼  >  Quit NVIM", ":qa<CR>"),
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip", --snippet engine
			"saadparwaiz1/cmp_luasnip", --nvim_cmp source
			"hrsh7th/cmp-nvim-lsp", -- lsp completion capabilites
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"rafamadriz/friendly-snippets", -- friendly snippets
			"onsails/lspkind.nvim", -- vs code like icons
		},
	},

	-- lsp config
	{ "neovim/nvim-lspconfig" },

	-- Mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_pending = " ",
						package_installed = "󰄳 ",
						package_uninstalled = " ",
					},
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"html",
					"cssls",
					"tsserver",
				},
			})
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}, -- enhanced lsp uis

	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)

	--auto paris
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*",
				css = { rgb_fn = true, hsl_fn = false },
				html = { names = true },
			})
		end,
	},

	{ "nvim-treesitter/nvim-treesitter" },

	-- install with yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		lazy = false,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- Comment nvim
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- configure formatters & linters
	{
		"jose-elias-alvarez/null-ls.nvim",
	},
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls--

	-- Vim maximiser
	{ "szw/vim-maximizer" },

	--Git signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"Exafunction/codeium.vim",
		config = function()
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},

	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
	},
})
