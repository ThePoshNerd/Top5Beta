local storyboard = require "storyboard"
local scene = storyboard.newScene()

--------------------

function scene:createScene( event )
local group = self.view
local mainGroup = display.newGroup()
local sideBarGroup = display.newGroup()


local mainMenuBackground = display.newRect( _W*0.5, _H*0.5, _W, _H )
mainMenuBackground:setFillColor( 229/255,229/255,229/255 )
mainGroup:insert(mainMenuBackground)

local topBar = display.newRect( _W*0.5, 0, _W, 96 )
topBar.y = topBar.height/2
topBar:setFillColor( 244/255,45/255,53/255 )
mainGroup:insert(topBar)

local sideBarBackground = display.newRect( _W*0.5, _H*0.5, 576, _H )
sideBarBackground:setFillColor( 229/255,229/255,129/255 )
sideBarBackground.x = _W*0.5 - sideBarBackground.width - 72
sideBarGroup:insert(sideBarBackground)

local sideBarTouch = display.newRect( _W*0.5, _H*0.5, 50, _H )
sideBarTouch:setFillColor( 129/255,229/255,129/255 )
sideBarTouch.x = sideBarBackground.x + 628/2
sideBarGroup:insert(sideBarTouch)
local sideSwipe = function(event)
print"side bar touched"
end
sideBarTouch:addEventListener("touch", sideSwipe)

end

--------------------

function scene:enterScene( event )

--
-- Manipulate objects here (e.g. scene logic)
--



end

--------------------

function scene:exitScene( event )

--
-- Optional cleanup code here
--
end

--------------------

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene