local function setup(parameters)
end


function global_lua_function()
    print "nvim-example-lua-plugin.myluamodule.init global_lua_function: hello"
end

-- Create a command, ':DoTheThing'
vim.api.nvim_create_user_command(
    'DoTheThing',
    function(input)
      print(vim.fn.system({'ls', '-a'}))
    end,
    {bang = true, desc = 'a new command to do the thing'}
)

--vim.keymap.set('n', 'M-C-G', local_lua_function, {desc = 'Run local_lua_function.', remap = false})

-- Create a named autocmd group for autocmds so that if this file/plugin gets reloaded, the existing
-- autocmd group will be cleared, and autocmds will be recreated, rather than being duplicated.
--local augroup = vim.api.nvim_create_augroup('highlight_cmds', {clear = true})

-- vim.api.nvim_create_autocmd('ColorScheme', {
--   pattern = 'rubber',
--   group = augroup,
--   -- There can be a 'command', or a 'callback'. A 'callback' will be a reference to a Lua function.
--   command = 'highlight String guifg=#FFEB95',
--   --callback = function()
--   --  vim.api.nvim_set_hl(0, 'String', {fg = '#FFEB95'})
--   --end
-- })

-- Returning a Lua table at the end allows fine control of the symbols that
-- will be available outside this file. Returning the table also allows the
-- importer to decide what name to use for this module in their own code.
--
-- Examples of how this module can be imported:
--    local mine = require('myluamodule')
--    mine.local_lua_function()
--    local myluamodule = require('myluamodule')
--    myluamodule.local_lua_function()
--    require'myluamodule'.setup({p1 = "value1"})
return {
    setup = setup,
    --local_lua_function = local_lua_function,
}
