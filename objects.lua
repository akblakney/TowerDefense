
local Object = {}

function Object:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

local Enemy = {}
Enemy.__index = Enemy

--Enemy object which all enemies extend from
function Enemy:new(xpos, ypos, drawable, type, health, disp)
    return setmetatable({
        xpos = xpos,
        ypos = ypos,
        drawable = drawable,
        type = type,
        health = health,
        disp = disp
    }, self)
end

local Troll = setmetatable({}, Enemy)
Troll.__index = Troll

function Troll:new(xpos, ypos, health, disp)
    print(6678)
    local enemy = Enemy:new(xpos, ypos, love.graphics.newImage('troll.jpg'), 'g', health, disp)
    return enemy
end


local Tower = {}
Tower.__index = Tower

function Tower:new(xpos, ypos, drawable, attack_type, bullet, shoot_pattern)
    return setmetatable({
        xpos = xpos,
        ypos = ypos,
        drawable = drawable,
        attack_type = attack_type,
        bullet = bullet,
        shoot_pattern = shoot_pattern
    }, self)
end

local BasicTower = setmetatable({}, Tower)
BasicTower.__index = BasicTower

function BasicTower:new(xpos, ypos, image, attack_type, bullet, shoot_pattern)
    local tower = Tower.new(self, xpos, ypos, 'basictower.jpg', 'bad', 'reg', 10)
    return tower
end

function drawEnemies(enemies)
    for _, enemy in ipairs(enemies) do
        print(555)
        love.graphics.draw(enemy.drawable, enemy.xpos, enemy.ypos)
    end
end

local Grid = {}
Grid.__index = Grid

--Grid object, which will keep track of the board
--and whether or not each space is occupied
function Grid:new(xdim, ydim)
    print(xdim, ydim)

    grid = {}
    for i=1, xdim do
        grid[i] = {}
        for j=1, ydim do
            grid[i][j] = false
        end
    end

    return setmetatable({
        xdim = xdim,
        ydim = ydim,
        grid = grid
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