Diver = {}
Diver.__index = Diver


function Diver:new (xPosition, yPosition, orientation)
    --[[ Diver
    Algorithm: swin
    START
        IF direction is vertical
            move to right to left or left to right
        ELSE IF direction is horizontal
            move to up to down
    END
    ]]
    self = setmetatable ({}, Diver)

    self.xPosition = xPosition
    self.yPosition = yPosition
    self.width = 30
    self.height = 30
    self.speed = 200
    self.orientation = orientation --- vertical, horizontal

    function self.sayHello ()
        print ('Grr, i\'m the Diver, buah buah fiiuak!')
    end

    function self.body ()
        love.graphics.rectangle ('fill', self.xPosition, self.yPosition, self.width, self.height)
    end

    function self.swim ()
    end

    return self
end

function Diver:draw ()
    self.body ()
end

function Diver:update (deltatime)
    if self.orientation == 'vertical' then
        self.yPosition = self.yPosition + self.speed * deltatime
    elseif self.orientation == 'horizontal' then
        self.xPosition = self.xPosition + self.speed * deltatime
    end
end
