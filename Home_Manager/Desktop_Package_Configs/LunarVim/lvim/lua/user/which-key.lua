local kind = require('user.kind')

local wk = lvim.builtin.which_key

wk.setup.plugins.presets.z = true
wk.setup.ignore_missing = true
wk.setup.plugins.presets['operators'] = false

wk.mappings['a'] = { ':Alpha<cr>', 'Dashboard' }

wk.mappings['S'] = {
	name = 'Persistence',
	s = { "<cmd>lua require('persistence').load()<cr>", 'Reload last session for dir' },
	l = { "<cmd>lua require('persistence').load({ last = true })<cr>", 'Restore last session' },
	Q = { "<cmd>lua require('persistence').stop()<cr>", 'Quit without saving session' },
}

wk.mappings['l']['t'] = { ':LvimToggleFormatOnSave<cr>', 'Toggle format-on-save' }
wk.mappings['l']['R'] = { ':LspRestart<cr>', 'Restart' }

wk.mappings['s']['w'] = {
	"<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
	' ' .. 'Search Word Under Cursor',
}

wk.mappings['m'] = {
	name = 'Harpoon',
	m = { ":lua require('harpoon.mark').add_file()<cr>", 'Mark file' },
	t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", 'Toggle UI' },
	a = { ":lua require('harpoon.ui').nav_file(1)<cr>", 'Goto mark 1' },
	s = { ":lua require('harpoon.ui').nav_file(2)<cr>", 'Goto mark 2' },
	d = { ":lua require('harpoon.ui').nav_file(3)<cr>", 'Goto mark 3' },
	f = { ":lua require('harpoon.ui').nav_file(4)<cr>", 'Goto mark 4' },
	g = { ":lua require('harpoon.ui').nav_file(5)<cr>", 'Goto mark 5' },
	q = { ":lua require('harpoon.ui').nav_file(6)<cr>", 'Goto mark 6' },
	w = { ":lua require('harpoon.ui').nav_file(7)<cr>", 'Goto mark 7' },
	e = { ":lua require('harpoon.ui').nav_file(8)<cr>", 'Goto mark 8' },
	r = { ":lua require('harpoon.ui').nav_file(9)<cr>", 'Goto mark 9' },
	n = { ":lua require('harpoon.ui').nav_next()<cr>", 'Next file' },
	p = { ":lua require('harpoon.ui').nav_prev()<cr>", 'Prev file' },
}

wk.mappings['W'] = {
	name = 'Window Ctrl',
	h = { '<C-w>|', 'Maximize window horizontally (|)' },
	v = { '<C-w>_', 'Maximize window vertically (_)' },
	['='] = { '<C-w>=', 'Resize windows equally' },
	S = { '<C-w>s', 'Split Window Horizontally' },
	V = { '<C-w>v', 'Split Window Vertically' },
	s = { ":lua require('telescope-tabs').list_tabs()<cr>", 'Search Tabs' },
}

wk.mappings['x'] = { ':xa<cr>', 'Save All and Quit' }

wk.mappings['t'] = {
	name = 'Telescope',
	p = { ':Telescope projects<cr>', 'Projects' }, -- requires telescope-project.nvim plugin
	r = { ':Telescope resume<cr>', 'Resume' },
}

wk.mappings['L'] = {
	name = 'TodoList',
	n = { "<cmd>lua require('todo-comments').jump_next()<cr>", ' Next Todo' },
	p = { "<cmd>lua require('todo-comments').jump_prev()<cr>", ' Prev Todo' },
	t = { '<cmd>TodoTrouble<cr>', ' Todo Trouble' },
	d = { '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', ' Todo/Fix/Fixme Trouble' },
	s = { '<cmd>TodoTelescope<cr>', ' Search Todos' },
	k = { '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', ' Search Todos Todo/Fix/Fixme' },
}

wk.mappings['j'] = {
	name = 'TrevJ',
	{ "<cmd>lua require('trevj').format_at_cursor()<cr>", 'Trevj' },
}

wk.mappings['M'] = {
	name = 'Trouble',
	r = { '<cmd>Trouble lsp_references<cr>', 'References' },
	f = { '<cmd>Trouble lsp_definitions<cr>', 'Definitions' },
	d = { '<cmd>Trouble document_diagnostics<cr>', 'Diagnostics' },
	q = { '<cmd>Trouble quickfix<cr>', 'QuickFix' },
	l = { '<cmd>Trouble loclist<cr>', 'LocationList' },
	w = { '<cmd>Trouble workspace_diagnostics<cr>', 'Diagnostics (Workspace)' },
}

wk.mappings['N'] = {
	name = 'Noice.UI',
	d = { '<cmd>NoiceDismiss<cr>', 'Dismiss' },
	l = { '<cmd>NoiceLast<cr>', 'Last Message' },
	n = { '<cmd>NoiceErrors<cr>', 'Errors' },
	h = { '<cmd>NoiceHistory<cr>', 'History' },
	t = { '<cmd>NoiceTelescope<cr>', 'Noice + Telescope' },
}

wk.mappings['Z'] = {
	name = 'ZenMode',
	{ '<cmd>ZenMode<cr>', 'Zen-Mode' },
}

wk.mappings['Q'] = {
	name = 'Quit',
	q = { '<cmd>qa<cr>', 'Quit Neovim' },
	w = { '<cmd>wqa<cr>', 'Quit Saving Everything' },
	Q = { '<cmd>qa!<cr>', 'Quit Anyway (without saving)' },
}

wk.mappings['y'] = {
	name = 'Mini Map',
	m = { '<cmd>MinimapToggle<cr>', 'Toggle Minimap' },
	c = { '<cmd>MinimapClose<cr>', 'Close Minimap' },
	r = { '<cmd>MinimapRescan<cr>', 'Rescan Minimap' },
	h = { '<cmd>MinimapUpdateHighlight<cr>', 'Update Highlights Minimap' },
}

wk.mappings['B'] = {
	name = 'Bracey',
	s = { '<cmd>Bracey<cr>', 'LiveServer Start' },
	S = { '<cmd>BraceyStop<cr>', 'LiveServer Stop' },
	r = { '<cmd>BraceyReload <cr>', 'LiveServer Reload' },
}

wk.mappings['J'] = {
	name = 'Notes',
	c = { '<cmd>Telekasten show_calendar<cr>', 'Calendar' },
	n = { '<cmd>Telekasten new_note<cr>', 'Note' },
	f = { '<cmd>Telekasten find_notes<cr>', 'Find' },
	F = { '<cmd>Telekasten find_daily_notes<cr>', 'Find Journal' },
	j = { '<cmd>Telekasten goto_today<cr>', 'Journal' },
	p = { '<cmd>Telekasten panel<cr>', 'Panel' },
	t = { '<cmd>Telekasten toggle_todo<cr>', 'Toggle Todo' },
}

-- lvim.builtin.which_key.mappings['T'] = nil
lvim.builtin.which_key.mappings['T'] = {
	name = 'Tab',
	f = {
		"<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
		'Find Tab',
	},
	n = { '<cmd>tabnew<cr>', 'New Tab' },
	c = { '<cmd>tabclose<cr>', 'Close Tab' },
	o = { '<cmd>tabonly<cr>', 'Only Tab' },
}
