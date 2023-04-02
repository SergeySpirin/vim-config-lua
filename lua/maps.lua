local keymap = vim.keymap

keymap.set('i', 'jk', '<Esc>')

-- Search
keymap.set('n', ',<Space>', ':nohl<CR>')

-- Explore
keymap.set('n', 'ex', ':Explore<CR>')

-- Tabs 
keymap.set('n', '<Tab>=', ':tabnew<CR>')
keymap.set('n', '<Tab>-', ':tabclose<CR>')
keymap.set('n', '<Tab>l', ':tabnext<CR>')
keymap.set('n', '<Tab>h', ':tabprevious<CR>')
