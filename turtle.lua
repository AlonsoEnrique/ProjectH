Turtle = {}
Turtle.__index = Turtle

function Turtle:new ()
    self = setmetatable ({}, Turtle)

    self.speed = 200
    self.body = 'sprites/turtle.png'
    self.soundWhenSwim = null

    self.radius = 30
    self.xPosition = love.graphics.getWidth () / 2
    self.yPosition = love.graphics.getHeight () - self.radius

    function self.sayHello ()
        love.graphics.print('Hi, i\'m the Turtle, take care!', 0, 0)
    end

    function self.move_to_left (deltaTime)
        if love.keyboard.isDown ('left') then
            if self.xPosition >= 0 then
                self.xPosition = self.xPosition - self.speed * deltaTime
            end
        end
    end

    function self.move_to_right (deltaTime)
        if love.keyboard.isDown ('right') then
            if self.xPosition <= love.graphics.getWidth () then
                self.xPosition = self.xPosition + self.speed * deltaTime
            end
        end
    end

    function self.move_to_up (deltaTime)
        if love.keyboard.isDown ('up') then
            if self.yPosition >= 0 then
                self.yPosition = self.yPosition - self.speed * deltaTime
            end
        end
    end

    function self.move_to_down (deltaTime)
        if love.keyboard.isDown ('down') then
            if self.yPosition <= love.graphics.getHeight () then
                self.yPosition = self.yPosition + self.speed * deltaTime
            end    
        end
    end

    function self.swim (deltaTime)
        self.move_to_left (deltaTime)
        self.move_to_right (deltaTime)
        self.move_to_down (deltaTime)
        self.move_to_up (deltaTime)
    end

    return self
end

function Turtle:load ()

end

function Turtle:draw ()
    love.graphics.circle('line', self.xPosition, self.yPosition, self.radius)
    self.sayHello ()
end

function Turtle:update (deltaTime)
    self.swim (deltaTime)
end
