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
    --[[
    Algorithm: update
    Description: This algorithm is a loop when the main actions happen
    START
        game_over()
        won()
        enough_hunting_dives()
        turtle.movement()
    END
    ]]
    turtle:update (deltaTime)
    
    generateDives ()

    for index, diver in ipairs (divers) do
        diver:update (deltaTime)
    end
end

function backgroundMusic ()
    background_music = love.audio.newSource('sounds/mainmenu.mp3', 'stream')
    background_music:setLooping(true)
    background_music:play(background_music)
end

function generateDives ()
    if timeToGenerateDiver == 0 then
        local xPosition = math.random (1, love.graphics.getWidth ())
        local yPosition = math.random (1, love.graphics.getHeight () / 2)
        table.insert (divers, Diver:new (xPosition, 0))

        timeToGenerateDiver = 10
    else
        timeToGenerateDiver = timeToGenerateDiver - 1
    end
end

function enoughDivesHunting ()
    -- IF exists enough dives hunting (enough_dives_hunting) the turtle
    -- GENERATE dives
    return true
end

--[[
Algorithm: game_over
START
    IF turtle is touch for divers
        RETURN True
    ELSE
        RETURN False
END
]]

--[[
Algorithm: won
START
    IF turtle reach final
        RETURN True
    ELSE
        RETURN False
END
]]

--[[
Algorithm: generateDives

START

END

]]
