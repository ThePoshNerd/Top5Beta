local storyboard = require "storyboard"
local scene = storyboard.newScene()

--------------------

function scene:createScene( event )
local group = self.view
local mainGroup = display.newGroup()
sideBarGroup = display.newGroup()


local mainMenuBackground = display.newRect( _W*0.5, _H*0.5, _W, _H )
mainMenuBackground:setFillColor( 229/255,229/255,229/255 )
mainGroup:insert(mainMenuBackground)

local topBar = display.newRect( _W*0.5, 0, _W, 96 )
topBar.y = topBar.height/2
topBar:setFillColor( 244/255,45/255,53/255 )
mainGroup:insert(topBar)

sideBarBackground = display.newRect( _W*0.5, _H*0.5, 576, _H )
sideBarBackground:setFillColor( 229/255,229/255,129/255 )
sideBarBackground.x = _W*0.5 - sideBarBackground.width - 72
sideBarGroup:insert(sideBarBackground)

sideBarTouch = display.newRect( _W*0.5, _H*0.5+48, 300, _H-96 )
sideBarTouch:setFillColor( 129/255,229/255,129/255 )
sideBarTouch.x = sideBarBackground.x + 608/2
sideBarTouch.alpha = 0.1
sideBarGroup:insert(sideBarTouch)



end

--------------------

function scene:enterScene( event )
local sideBarState = "closed"
local beginX 
local beginY  
local endX  
local endY 
 
local xDistance  
local yDistance  
 
function checkSwipeDirection()
 
        xDistance =  math.abs(endX - beginX) -- math.abs will return the absolute, or non-negative value, of a given value. 
        yDistance =  math.abs(endY - beginY)
        
        if xDistance > yDistance then
                if beginX > endX then
                    if sideBarState == "open" then
					sideBarState = "closed"
					print(sideBarState)
					transition.to(sideBarGroup, { time=100,x = 0 , transition=easing.inOutQuad })
                    print("swipe left")
				end
                else 
					if sideBarGroup.x > 10 and sideBarState == "closed" then
					sideBarState = "open"
					print(sideBarState)
					transition.to(sideBarGroup, { time=100,x = 576 , transition=easing.inOutQuad })
                    print("swipe right")
					end
                end
        else 
                if beginY > endY then
                        print("swipe up")
                else 
                        print("swipe down")
                end
        end
        
end
 
 
function swipe(event)
        if event.phase == "began" then
                beginX = event.x
                beginY = event.y
        end
        
        if event.phase == "ended"  then
                endX = event.x
                endY = event.y
                checkSwipeDirection();
        end
end
 
Runtime:addEventListener("touch", swipe)


local function sideSwipe( event )
	local t = event.target

	local phase = event.phase
	if "began" == phase then
		t.isFocus = true

		-- Store initial position

		sideBarGroup.x0 = event.x - sideBarGroup.x
	elseif t.isFocus then
		if "moved" == phase then
			sideBarGroup.x = event.x - sideBarGroup.x0
		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus( nil )
			t.isFocus = false

		end
	end
end
sideBarTouch:addEventListener("touch", sideSwipe)




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