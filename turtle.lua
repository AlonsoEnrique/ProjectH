Turtle = {}
Turtle.__index = Turtle

function Turtle:new ()
    --[[ Turtle
    speed: POSITIVE INTEGER
    body
    sound_when_swim
    ]]
    self = setmetatable ({}, Turtle)

    self.radius = 20
    self.x = love.graphics.getWidth () / 2
    self.y = love.graphics.getHeight () - self.radius

    self.velocity = 300

    function self.sayHello ()
                print ('Hi, i\'m the Turtle, take care!')
    end

    function self.move_to_left (dt)
        if love.keyboard.isDown ('left') then
            self.x = self.x - self.velocity * dt
        end
    end

    function self.move_to_right (dt)
        if love.keyboard.isDown ('right') then
            self.x = self.x + self.velocity * dt
        end
    end

    function self.move_to_up (dt)
        if love.keyboard.isDown ('up') then
            self.y = self.y - self.velocity * dt
        end
    end

    function self.move_to_down (dt)
        if love.keyboard.isDown ('down') then
            self.y = self.y + self.velocity * dt
        end
    end

    --[[
    Algorithm: swim
    START
        IF player move to LEFT
            swim to left
        ELSE IF player move to RIGHT
            swim to right
        ELSE IF player move to up
            swim to up
        ELSE
            swim to down
    END
    ]]

    -- TODO: best way for this?
    function self.body ()
        love.graphics.circle('line', self.x, self.y, self.radius)
    end

    return self
end

function Turtle:load ()
    local body = self.body ()
end

function Turtle:draw ()
    self.body()
end

function Turtle:update (deltatime)
    self.move_to_left (deltatime)
    self.move_to_right (deltatime)
    self.move_to_up (deltatime)
    self.move_to_down (deltatime)
end
