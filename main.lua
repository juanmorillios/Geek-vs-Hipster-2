-----------------------------------------------------------------------------------------
--
-- main.lua Juan Manuel Morillo (JuanMorillios)
--
-----------------------------------------------------------------------------------------
--

--Cargamos Libreria con la que vamos a trabajar
local physics  = require("physics")

--Inicializamos la Libreria
physics.start( )


--Declaramos las variables para controlar tamaño ancho y alto de la pantalla, más bien centralizar
local centerX = display.contentCenterX
local centerY = display.contentCenterY


--Controlamos ancho y alto
local ancho = display.contentWidth
local alto = display.contentHeight

--Como el valor de esta variable no cambiará, la declaro como Constante
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

--Creamos un bloque para controlar que el Geek1 no se escape por el lado Izquierdo
local paredIzq = display.newRect(1, _H/2, 2, _H)
physics.addBody( paredIzq, "static", {density = 0.1, friction = 0.6, bounce = 0})

--Creamos un bloque para controlar que el Geek1 no se escape por el lado Derecho
local paredDer = display.newRect(_W - 1, _H/2, 2, _H)
physics.addBody( paredDer, "static", {density = 0.1, friction = 0.6, bounce = 0} )

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
