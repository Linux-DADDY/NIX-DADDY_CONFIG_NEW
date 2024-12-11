local themes = {
	gruvbox = 'gruvbox',
	rose_pine = 'rose-pine',
	lunar = 'lunar',
	gruvbox_material = 'gruvbox-material',
	horizon = 'horizon',
	tokyonight = 'tokyonight',
	tokyonight_night = 'tokyonight-night',
	tokyonight_moon = 'tokyonight-moon',
	desert = 'desert',
	morning = 'morning',
	sonokai = 'sonokai',
	edge = 'edge',
	ayu = 'ayu',
	nightfox = 'nightfox',
	duskfox = 'duskfox',
	nordfox = 'nordfox',
	terafox = 'terafox',
	onedark_vivid = 'onedark_vivid',
	onedark_dark = 'onedark_dark',
	everforest = 'everforest',
	kanagawa = 'kanagawa',
	kanagawa_dragon = 'kanagawa-dragon',
	oxocarbon = 'oxocarbon',
}

lvim.colorscheme = themes.nightfox

-- if vim.g.neovide then
-- 	lvim.transparent_window = false
-- 	return
-- end

local extra_opts = {
	sonokai = {
		styles = {
			espresso = 'espresso',
			shusia = 'shusia',
			default = 'default',
		},
	},
	ayu = {
		styles = {
			mirage = 'mirage',
			light = 'light',
			dark = 'dark',
		},
	},
	edge = {
		styles = {
			aura = 'aura',
			neon = 'neon',
		},
		airline_theme = 'edge',
		lualine_theme = 'edge',
	},
}

if lvim.colorscheme == themes.sonokai then
	vim.g.sonokai_style = 'espresso'
	vim.g.sonokai_style = 'shusia'
	vim.g.sonokai_style = 'default'
end

if lvim.colorscheme == themes.edge then
	vim.g.airline_theme = extra_opts.edge.airline_theme
	vim.g.edge_style = extra_opts.edge.styles.aura
	lvim.builtin.lualine.options.theme = extra_opts.edge.lualine_theme
end

if lvim.colorscheme == themes.ayu then
	vim.g.ayucolor = extra_opts.ayu.styles.mirage
end
