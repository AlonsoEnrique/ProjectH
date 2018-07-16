require 'turtle'
require 'diver'

function love.load ()
    --[[ Sea
    turtle_population: POSITIVE INTEGER
    turtle: Turtle OBJECT
    divers: Diver OBJECT LIST
    is_enough_dives_hunting: BOOLEAN
    natural_sounds: STRING
    ]]
    math.randomseed (os.time ())

    turtle = Turtle:new ()
    turtle.sayHello ()

    diverList = {}

    timeToGenerateDiver = 20
    background_music = love.audio.newSource('sounds/mainmenu.mp3', 'stream')
    background_music:setLooping(true)
    background_music:play(background_music)
end

function love.draw ()
    turtle:draw()

--[[     for index, diver in ipairs (diverList) do
        diver:draw ()
    end ]]
end

function love.update (deltatime)
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
    turtle:update (deltatime)

    if timeToGenerateDiver == 0 then
        local xPosition = math.random (1, love.graphics.getWidth ())
        local yPosition = math.random (1, love.graphics.getHeight () / 2)
        table.insert (diverList, Diver:new (xPosition, yPosition))

        timeToGenerateDiver = 20

    else
        timeToGenerateDiver = timeToGenerateDiver - 1
    end

    for index, diver in ipairs (diverList) do
        diver:update (deltatime)
    end
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
Algorithm: enough_dives_hunting
START
    IF exists enough dives hunting (enough_dives_hunting) the turtle
        GENERATE dives
END
]]
