Earth = {}
Earth.__index = Earth

function Earth:new ()
    self = setmetatable ({}, Earth)

    self.radius = 50
    self.x = love.graphics.getWidth () / 2
    self.y = love.graphics.getHeight () - self.radius

    self.velocity = 300

    function self.sayHello ()
                print ('Hi, i\'m the Earth, take care!')
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

    -- TODO: best way for this?
    function self.body ()
        love.graphics.circle('line', self.x, self.y, self.radius)
    end

    return self
end

function Earth:load ()
    local body = self.body ()
end

function Earth:draw ()
    self.body()
end

function Earth:update (deltatime)
    self.move_to_left (deltatime)
    self.move_to_right (deltatime)
end

