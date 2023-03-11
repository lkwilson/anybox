function set_colors(color)
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function rosedawn()
	set_colors("rose-pine-dawn")
end

function rose()
	set_colors("rose-pine")
end

function rosemoon()
	set_colors("rose-pine-moon")
end

rose()

