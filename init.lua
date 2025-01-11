require("avah.options")
require("avah.keymaps")
require("avah.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		print("Welcome to Neovim !")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	desc = "Source ftplugin/$1.lua to override Issue #626",
	group = vim.api.nvim_create_augroup("Harpoon_Optlocal", { clear = true }),
	callback = function()
		local ft = vim.bo.filetype
		vim.cmd("silent! source ~/.config/nvim/after/ftplugin/" .. ft .. ".lua")
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

vim.cmd("colorscheme dawnfox")
