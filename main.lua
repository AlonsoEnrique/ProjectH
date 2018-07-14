require 'turtle'
require 'diver'

function love.load ()
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

    for index, diver in ipairs (diverList) do
        diver:draw ()
    end
end

function love.update (deltatime)
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
