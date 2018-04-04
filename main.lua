require 'earth'

function love.load ()
    earth = Earth:new ()
    earth.sayHello ()
end

function love.update (deltatime)
    earth:update (deltatime)
end

function love.draw ()
    earth.body()
end