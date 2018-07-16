Diver = {}
Diver.__index = Diver


function Diver:new (x, y)
    --[[ Diver
    speed: POSITIVE INTEGER
    direction: CHOICES -> vertical, horizontal
    Algorithm: swin
    START
        IF direction is vertical
            move to right to left or left to right
        ELSE IF direction is horizontal
            move to up to down
    END
    ]]
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
