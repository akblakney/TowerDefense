
local Object = {}

function Object:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

local Enemy = Object:new {
    xpos = 0,
    ypos = 0,
    drawable = nil,
    type = '',
    health = 0,
    disp = 0
}

local Troll = Enemy:new {
    drawable = love.graphics.newImage('troll.jpg'),
    type = 'g',
}

local Tower = Object:new {
    drawable = nil,
    attack_type = '',
    bullet = nil,
    shoot_frequency = 0
}


local BasicTower = Tower:new {
    drawable = love.graphics.newImage('basictower.jpg'),
    attack_type = 'r',
    bullet = 'r',
    shoot_frequency = 10
}


function drawEnemies(enemies)
    for _, enemy in ipairs(enemies) do
        love.graphics.draw(enemy.drawable, enemy.xpos, enemy.ypos)
    end
end

local Grid = {}
Grid.__index = Grid

--Grid object, which will keep track of the board
--and whether or not each space is occupied
function Grid:new(xdim, ydim)
    print(xdim, ydim)

    grid1 = {}
    for i=1, xdim do
        grid1[i] = {}
        for j=1, ydim do
            grid1[i][j] = 5
        end
    end

    return setmetatable({
        xdim = xdim,
        ydim = ydim,
        grid = grid1
    }, self)
end




exports = {
    Object = Object,
    Enemy = Enemy,
    Troll = Troll,
    Tower = Tower,
    BasicTower = BasicTower,
    drawEnemies = drawEnemies,
    Grid = Grid,
}

return exports