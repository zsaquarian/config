local tree ={}

tree.open = function ()
    require'bufferline.state'.set_offset(31, 'FileTree')
    require'nvim-tree'.find_file(true)
end

tree.close = function ()
    require'bufferline.state'.set_offset(0)
    require'nvim-tree'.close()
end

tree.toggle = function ()
    require'nvim-tree'.toggle(true)
    local open = require('nvim-tree.view').win_open()
    print(open)
    local offset
    if open then
        offset = 31
    else
        offset = 0
    end

    require('bufferline.state').set_offset(offset, 'FileTree')
end

return tree
