require 'turtle'
require 'diver'
local anim8 = require 'libs/anim8'

function love.load ()
    math.randomseed (os.time ())

    turtlePopulation = null -- POSITIVE INTEGER
    turtle = Turtle:new ()
    divers = {} -- LIST
    isEnoughDivesHunting = null -- BOOLEAN
    timeToGenerateDiver = 20

    backgroundMusic ()
end

function love.draw ()
    turtle:draw()

    for index, diver in ipairs (divers) do
        diver:draw ()
    end
end

function love.update (deltaTime)
    gameOver ()
    won ()
    addDivers ()
    
    for index, diver in ipairs (divers) do
        diver:update (deltaTime)
    end

    turtle:update (deltaTime)
end

function backgroundMusic ()
    background_music = love.audio.newSource('sounds/mainmenu.mp3', 'stream')
    background_music:setLooping(true)
    background_music:play(background_music)
end

function addDivers ()
    if enoughDiversHunting () == true then
        if timeToGenerateDiver == 0 then
            randomPosition = math.random (1, 2)

            if randomPosition == 1 then
                position = 'vertical'
                xPosition = math.random (1, love.graphics.getWidth ())
                yPosition = 1
            elseif randomPosition == 2 then
                position = 'horizontal'
                xPosition = 0
                yPosition = math.random (1, love.graphics.getHeight ())
            end

            table.insert (divers, Diver:new (xPosition, yPosition, position))

            timeToGenerateDiver = 10
        else
            timeToGenerateDiver = timeToGenerateDiver - 1
        end
    end
end

function enoughDiversHunting ()
    -- IF exists enough dives hunting (enough_dives_hunting) the turtle
    -- GENERATE dives
    return true
end

function gameOver ()
end
    --[[
Algorithm: gameOver
START
    IF turtle is touch for divers
        RETURN True
    ELSE
        RETURN False
END
]]

function won ()
end
--[[
Algorithm: won
START
    IF turtle reach final
        RETURN True
    ELSE
        RETURN False
END
]]

