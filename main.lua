require 'earth'

function love.load ()
    earth = Earth:new ()
    earth.sayHello ()
end

function love.draw ()
    earth:draw()
end

function love.update (deltatime)
    earth:update (deltatime)
end
