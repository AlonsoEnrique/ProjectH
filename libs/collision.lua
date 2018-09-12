function checkCollision (aX, aY, aWidth, aHeight, bX, bY, bWidth, bHeight)
    if aX < bX + bWidth and aX + aWidth > bX and aY < bY + bHeight and aY + aHeight > bY then
        return true
    end
end
