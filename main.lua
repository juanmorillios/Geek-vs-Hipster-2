-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--

local physics  = require("physics")

physics.start( )

local centerX = display.contentWidth
local centerY = display.contentHeight

--local ancho = display.contentWidth
--local alto = display.contentHeight


--Cargamos el fondo del juego

local fondoJuego = display.newImage("background.png", centerX, centerY)
fondoJuego:scale( display.contentWidth/fondoJuego.contentWidth, display.contentHeight/fondoJuego.contentHeight )
fondoJuego.x = display.contentWidth/2
fondoJuego.y = display.contentHeight/2

--Ocultamos Barra Estado

display.setStatusBar(display.HiddenStatusBar)

--Agregamos personaje principal del Juego.

--[[local personaje1 = display.newImage("Hipster.png", centerX-150, centerY+30)

physics.addBody( personaje1, "dynamic", {density = 0.6, friction = 0.2, bounce = 0.2} )

--Suelo

local suelo = display.newRect(centerX, _H - 1, _W, 2)

physics.addBody( suelo, "static", {density = 0.9, friction = 0.2, bounce = 0.7} )
]]