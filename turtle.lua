Turtle = {}
Turtle.__index = Turtle

function Turtle:new ()
    self = setmetatable ({}, Turtle)

    self.speed = 200
    self.body = null
    self.soundWhenSwim = null

    self.radius = 30
    self.x_position = love.graphics.getWidth () / 2
    self.y_position = love.graphics.getHeight () - self.radius

    function self.sayHello ()
        print ('Hi, i\'m the Turtle, take care!')
    end

    function self.move_to_left (deltaTime)
        if love.keyboard.isDown ('left') then
            self.x_position = self.x_position - self.speed * deltaTime
        end
    end

    function self.move_to_right (deltaTime)
        if love.keyboard.isDown ('right') then
            self.x_position = self.x_position + self.speed * deltaTime
        end
    end

    function self.move_to_up (deltaTime)
        if love.keyboard.isDown ('up') then
            self.y_position = self.y_position - self.speed * deltaTime
        end
    end

    function self.move_to_down (deltaTime)
        if love.keyboard.isDown ('down') then
            self.y_position = self.y_position + self.speed * deltaTime
        end
    end

    function self.swim (deltaTime)
        self.move_to_left (deltaTime)
        self.move_to_right (deltaTime)
        self.move_to_down (deltaTime)
        self.move_to_up (deltaTime)
    end

    -- TODO: best way for this?
    function self.body ()
        love.graphics.circle('line', self.x_position, self.y_position, self.radius)
    end

    return self
end

function Turtle:load ()
    local body = self.body ()
end

function Turtle:draw ()
    self.body()
end

function Turtle:update (deltaTime)
    self.swim (deltaTime)
end
