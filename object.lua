Object = {}
Object.__index = Object

function Object:new (x, y)
    self = setmetatable ({}, Object)

--    self.sprite = love.graphics.newImage ('penguin.png')

    self.x = x
    self.y = y
    self.w = 20
    self.h = 20

    self.vel = 60

    self.sayHello = function ()
        print ('Hi human!')
    end
    
    -- TODO: Best syntax function self.update or self.update = function (dt)...
    function self.update (dt)
        self.y = self.y + self.vel * dt
    end
    
    self.update = function (dt)
        self.y = self.y + self.vel * dt
    end

    self.draw = function ()
        love.graphics.rectangle ('fill', self.x, self.y, self.w, self.h)
    end

    return self
end

-- Another way for use Class methods. This code can be placed inside :new method
--function Object:sayHello ()
--    print ('Hi human!')
--end

--function Object:update (dt)
--    self.y = self.y + self.vel * dt
--end

--function Object:draw ()
--    love.graphics.rectangle ('fill', self.x, self.y, self.w, self.h)
--end
