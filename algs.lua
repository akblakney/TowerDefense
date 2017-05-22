function drawGrid(grid, pixel_len)
    xdim = #grid
    part_len = math.floor(pixel_len / xdim)
    square_len = math.floor(part_len * .75)
    init_xpos = 20
    init_ypos = 100
    xpos = init_xpos
    ypos = init_ypos
    love.graphics.setColor(255, 0, 0)

    for _, column in ipairs(grid) do
        xpos = init_xpos
        for _, square in ipairs(column) do
            love.graphics.rectangle('fill', xpos, ypos, square_len, square_len)
            xpos = xpos + part_len
        end
        ypos = ypos + part_len
    end

end

exports = {
    drawGrid = drawGrid
}

return exports