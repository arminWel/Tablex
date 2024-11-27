" Title:        Tablex
" Description:  A nvim plugin to create latex tables in a spreadsheet style view.
" Last Change:  22 November 2024
" Maintainer:   ArminWel <https://github.com/arminWel>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_tablex")
    finish
endif
let g:loaded_tablex = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/tablex/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
" command! -nargs=0 FetchTodos lua require("example-plugin").fetch_todos()
" command! -nargs=0 InsertTodo lua require("example-plugin").insert_todo()
" command! -nargs=0 CompleteTodo lua require("example-plugin").complete_todo()