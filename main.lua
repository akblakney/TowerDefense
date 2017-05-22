objects = require 'objects'
algs = require 'algs'

local GameState = {
    IN_ROUND = {},
    PAUSED = {},
    BETWEEN_ROUNDS = {}
}

enemies = {
    objects.Troll:new {xpos = 80, ypos = 80}
}


function love.load()
    --set screen dimensions on start
    SCREEN_WIDTH = 1024
    SCREEN_HEIGHT = 768
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)

    -- set other variables on start
    gamestate = GameState.BETWEEN_ROUNDS

    GRID_WIDTH = 10
    GRID_HEIGHT = 10
    grid = objects.Grid:new(GRID_WIDTH, GRID_HEIGHT)

    GRID_PIXEL_LENGTH = 650

end

function love.draw()
    love.graphics.print("H", 700, 300)
    algs.drawGrid(grid.grid, GRID_PIXEL_LENGTH)
    objects.drawEnemies(enemies)

end