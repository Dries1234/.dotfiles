local function req(file) require("dodo.configs.lsp." .. file) end

return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end
	},
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = true,
	},
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				"hrsh7th/cmp-cmdline",
				"onsails/lspkind.nvim",
			},
		},
		config = function()
			req('cmp')
		end
	},
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ "aznhe21/actions-preview.nvim" },
		},
		config = function()
			req('lspconfig')
		end
	},

	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lsp_lines").setup()
		end,
	},

	{
		'stevearc/conform.nvim',
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fb",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				typescript = { "prettier" },
				vue = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },

			},
		},
	},
}
