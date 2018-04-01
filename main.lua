require 'object'

function love.load ()
    object1 = Object:new (100, 100)
    object1.sayHello ()
end

function love.update (deltatime)
    object1.update (deltatime)
end

function love.draw ()
    object1.draw ()
end