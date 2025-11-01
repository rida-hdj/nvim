return {
	'nvim-treesitter/nvim-treesitter',
	buils = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
	highlight = {
	enable = true,
	},
	indent = { enable = true },
	autotage = { enable = true },
	ensure_installed = {
	-- Low level
	    "c", "cpp", "rust", "asm",
	
	-- System / Linux configs
	    "bash", "ini", "toml", "json",
	
	-- NixOS language
	    "nix",
	
	-- Web Dev
	    "html", "css", "javascript", "typescript",
	    "yaml", "markdown", "markdown_inline",

	-- Optional but useful
	    "lua", "vim", "query"

	},
	auto_install = false,

		})
	end
}
