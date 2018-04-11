Waste = {}
Waste.__index = Waste


function Waste:new (x, y)
    self = setmetatable ({}, Waste)

    self.x = x
    self.y = y
    self.w = 20
    self.h = 20

    self.vel = 60

    function self.sayHello ()
        print ('Grr, i\'m the Waste, buah buah fiiuak!')
    end

    function self.body ()
        love.graphics.rectangle ('fill', self.x, self.y, self.w, self.h)
    end

    return self
end

function Waste:draw ()
    self.body ()
end

function Waste:update (deltatime)
   self.y = self.y + self.vel * deltatime;
end

-- TODO: Create a waste generator