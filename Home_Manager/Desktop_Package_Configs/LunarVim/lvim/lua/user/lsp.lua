local lvim_lsp = require('lvim.lsp')
local ts = require('typescript')

-- configure tsserver server manually.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { 'tsserver' })

local common_on_attach = lvim_lsp.common_on_attach
local common_capabilities = lvim_lsp.common_capabilities()

lvim.lsp.on_attach_callback = function(client, bufnr)
	if lvim.colorscheme == 'gruvbox' then
		-- change coloring of errors so I can actually read them with gruvbox
		vim.cmd(':hi DiagnosticError guifg=#de5b64 guibg=#1C1C1C')
		vim.cmd(':hi DiagnosticWarn guifg=DarkOrange ctermfg=DarkYellow')
		vim.cmd(':hi DiagnosticInfo guifg=Cyan ctermfg=Cyan')
		vim.cmd(':hi DiagnosticHint guifg=White ctermfg=White')
	end
end

-- Typescript config using typescript.nvim
ts.setup({
	server = {
		root_dir = require('lspconfig.util').root_pattern('.git'),
		capabilities = common_capabilities,
		on_attach = common_on_attach,
	},
})

-- -- Keeping this here for reference
-- require('lvim.lsp.manager').setup('tsserver', {
-- 	root_dir = require('lspconfig.util').root_pattern('.git'),
-- 	on_attach = common_on_attach,
-- 	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript' },
-- 	cmd = {
-- 		'typescript-language-server',
-- 		'--stdio',
-- 	},
-- })

-- -- NOTE: DENO ls
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= 'denols'
-- end, lvim.lsp.automatic_configuration.skipped_servers)

local formatters = require('lvim.lsp.null-ls.formatters')

formatters.setup({
	{
		name = 'stylua',
		filetypes = {
			'lua',
		},
	},
})

formatters.setup({
	{
		name = 'alejandra',
		filetypes = {
			'nix',
		},
	},
})

-- formatters.setup({
-- 	{
-- 		name = 'nixpkgs_fmt',
-- 		filetypes = {
-- 			'nix',
-- 		},
-- 	},
-- })

formatters.setup({
	{
		command = 'prettierd',
		filetypes = {
			'css',
			'scss',
			'less',
			'html',
			'javascript',
			'javascriptreact',
			'typescript',
			'typescriptreact',
			'yaml',
			'markdown',
			'markdown_inline',
			'markdown.mdx',
			'graphql',
			'handlebars',
			'json',
		},
	},
})

local linters = require('lvim.lsp.null-ls.linters')
linters.setup({
	{
		command = 'eslint_d',
		filetypes = { 'javascript', 'typescript', 'typescriptreact', 'json' },
	},
})

lvim.lsp.diagnostics.float.max_width = 120
lvim.lsp.diagnostics.float.focusable = true

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { 'emmet-ls' })

local lsp_manager = require('lvim.lsp.manager')

lsp_manager.setup('emmet_ls', {
	filetypes = {
		'astro',
		'html',
		-- 'javascript',
		-- 'javascriptreact',
		-- 'typescript',
		-- 'typescriptreact',
		'css',
		'sass',
		'scss',
		'less',
	},
	on_init = require('lvim.lsp').common_on_init,
	capabilities = require('lvim.lsp').common_capabilities(),
})

-- -- codeium setup
-- table.insert(lvim.builtin.cmp.sources, { name = 'codeium' })
-- lvim.builtin.cmp.formatting.source_names.codeium = '(Codeium)'
-- local default_format = lvim.builtin.cmp.formatting.format
-- lvim.builtin.cmp.formatting.format = function(entry, vim_item)
-- 	vim_item = default_format(entry, vim_item)
-- 	if entry.source.name == 'codeium' then
-- 		vim_item.kind = ''
-- 		vim_item.kind_hl_group = 'CmpItemKindCodeium'
-- 	end
-- 	return vim_item
-- end
-- vim.api.nvim_set_hl(0, 'CmpItemKindCodeium', { fg = '#FDE030' })
