

_W = display.contentCenterX
_H = display.contentHeight


--local square = display.newRect( , 0, 100, 100 )
local square = display.newRect( 0, 0, 100, 100 )
square:setFillColor( 255, 255, 255, 123, 23 )

square.x = _W/2
square.y = _H/2

local square2 = display.newRect( 0, 0, 50, 50 )
square2:setFillColor( 0,255,212,45,23 )

square.x = _W/2
square.y = _H/2

transition.to( square, {time= 1500, x = 250, y = 400} )
transition.from( square, {time= 1500, x = 275, y = 0})