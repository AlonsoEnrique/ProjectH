require 'earth'
require 'waste'

function love.load ()
    math.randomseed (os.time ())

    earth = Earth:new ()
    earth.sayHello ()

    wasteList = {}

    timeToGenerateWaste = 20
end

function love.draw ()
    earth:draw()

    for index, waste in ipairs (wasteList) do
        waste:draw ()
    end
end

function love.update (deltatime)
    earth:update (deltatime)

    if timeToGenerateWaste == 0 then
        local xPosition = math.random (1, love.graphics.getWidth ())
        local yPosition = math.random (1, love.graphics.getHeight () / 2)
        table.insert (wasteList, Waste:new (xPosition, yPosition))

        timeToGenerateWaste = 20

    else
        timeToGenerateWaste = timeToGenerateWaste - 1
    end

    for index, waste in ipairs (wasteList) do
        waste:update (deltatime)
    end
end
