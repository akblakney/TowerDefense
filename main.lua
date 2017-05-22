objects = require 'objects'

local GameState = {
    IN_ROUND = {},
    PAUSED = {},
    BETWEEN_ROUNDS = {}
}

enemies = {
    objects.Troll:new(70, 70, 5, 5),
    objects.Troll:new(80, 80, 5, 5)
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

end

function love.draw()
    love.graphics.print("H", 700, 300)
    --objects.drawGrid()
    objects.drawEnemies(enemies)

end