-----------------------------------------------------------------------------------------
--
-- main.lua Juan Manuel Morillo (JuanMorillios)
--
-----------------------------------------------------------------------------------------
--

local physics  = require("physics")

physics.start( )

local centerX = display.contentCenterX
local centerY = display.contentCenterY

local ancho = display.contentWidth
local alto = display.contentHeight

local _W = display.contentWidth
local _H = display.contentHeight


--Ocultamos Barra Estado

display.setStatusBar(display.HiddenStatusBar)

--Cargamos el fondo del juego

local background1 = display.newImage("background.png", centerX, centerY)
background1:scale( display.contentWidth/background1.contentWidth, display.contentHeight/background1.contentHeight )
background1.x = display.contentWidth/2
background1.y = display.contentHeight/2


--Agregamos personaje principal del Juego.

local geek1 = display.newImage("superGeek.png", centerX-200, centerY+20)

physics.addBody(geek1, "dynamic" ,{density=0.6, friction=0.2, bounce=0.2})

--Suelo

local suelo = display.newRect(centerX, _H, _W, 10)

physics.addBody( suelo, "static", {density = 0.1, friction = 0.6, bounce = 0} )



--Gestión de Eventos para el Juego

function getTouched(event)

    if event.phase == "began" then
       display.getCurrentStage( ):setFocus( geek1 )

       elseif event.phase == "ended" then
           geek1:applyLinearImpulse( event.xStart - event.x, event.yStart - event.y, geek1.x, geek1.y )
           display.getCurrentStage( ):setFocus( nil )


    end


end



geek1:addEventListener( "touch", getTouched )
