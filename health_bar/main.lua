love.graphics.setDefaultFilter('nearest', 'nearest') -- for pixel art

function love.load()
    healthbar = {}
    healthbar.x = 32
    healthbar.y = 47
    healthbar.width = 92
    healthbar.height = 12
    healthbar.life = 4
    healthbar.background = love.graphics.newImage('sprites/background.png') 
    healthbar.bar = love.graphics.newImage('sprites/health-bar.png') 

    life = {}
    life.recovery = 1
    life.damage = 1

    font = love.graphics.newFont('font/Minecraft.ttf', 16, 'normal')
end

function love.update(dt)
   -- nothing here :P
end

function love.draw()
    -- scale everything inside by 4
    love.graphics.push()
    love.graphics.scale(4, 4)
        -- background
        love.graphics.draw(healthbar.background, 0, 0)
        
        -- health bar
        love.graphics.draw(healthbar.bar, healthbar.x, healthbar.y)

        -- health bar status
        healthbarStatus()
        love.graphics.rectangle ('fill', healthbar.x + 2, healthbar.y + 2, healthbar.width, healthbar.height)

        -- print title
        love.graphics.setColor(29 / 255, 43 / 255, 83 / 255, 1) -- color dark blue
        love.graphics.setFont(font)
        love.graphics.print('HEALTH BAR', 29, 20)

        -- print health values
        healthValues()

        -- reset color
        love.graphics.setColor(1, 1, 1, 1)

    love.graphics.pop()
    
end

----------------------
-- CUSTOM FUNCTIONS --
----------------------

-- healthbar status
function healthbarStatus()
    -- health bar behaviour
    if healthbar.life >= 4 then 
        -- full green bar
        love.graphics.setColor(0, 228 / 255, 54 / 255, 1) -- color green
        healthbar.width = 92 -- 100%
    elseif healthbar.life == 3 then
        -- green bar
        love.graphics.setColor(41 / 255, 173 / 255, 1, 1) -- color blue
        healthbar.width = 69 -- 75%
    elseif healthbar.life == 2 then
        -- yellow bar
        love.graphics.setColor(1, 236 / 255, 39 / 255, 1) -- color yellow
        healthbar.width = 46 -- 50%
    elseif healthbar.life == 1 then
        -- red bar
        love.graphics.setColor(1, 0, 77 / 255, 1) -- color red
        healthbar.width = 23 -- 25%
    elseif healthbar.life == 0 then
        -- no bar
        healthbar.width = 0 -- 0%
    end
end

-- health bar values
function healthValues()
    love.graphics.setColor(29 / 255, 43 / 255, 83 / 255, 1) -- color dark blue
    if healthbar.life >= 1 and healthbar.life <= 4 then 
        love.graphics.print(healthbar.life, 76, 74)
    elseif healthbar.life == 0 then
        love.graphics.print('DEAD', 59, 74)
    end
end

-- check life on the healthbar
function love.keypressed(key)
    if key == 'up' and healthbar.life >= 0 and healthbar.life <= 3 then
        healthbar.life = healthbar.life + life.recovery
    elseif key == 'down' and healthbar.life >= 1 and healthbar.life <= 4 then
        healthbar.life = healthbar.life - life.damage
    end
end

