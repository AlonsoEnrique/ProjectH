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

    function self.draw ()
        love.graphics.polygon ('fill')
    end

    return self
end


# TODO: Create a waste generator