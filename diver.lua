Diver = {}
Diver.__index = Diver


function Diver:new (x, y)
    self = setmetatable ({}, Diver)

    self.x = x
    self.y = y
    self.w = 20
    self.h = 20

    self.vel = 60

    function self.sayHello ()
        print ('Grr, i\'m the Diver, buah buah fiiuak!')
    end

    function self.body ()
        love.graphics.rectangle ('fill', self.x, self.y, self.w, self.h)
    end

    return self
end

function Diver:draw ()
    self.body ()
end

function Diver:update (deltatime)
   self.y = self.y + self.vel * deltatime;
end

-- TODO: Create a Diver generator