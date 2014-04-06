local storyboard = require "storyboard"
local scene = storyboard.newScene()

--------------------

function scene:createScene( event )
local group = self.view

mainGroup = display.newGroup()
sideBarGroup = display.newGroup()
sideScrollGroup = display.newGroup()
sideBarGroup.x = -576
sideScrollGroup.x = -576


-- MainMenu Assets


local mainMenuBackground = display.newImage( "mainMenuAssets/MainMenuBackground.jpg" )
mainMenuBackground.y = _H*0.5
mainMenuBackground.x = _W*0.5
mainGroup:insert(mainMenuBackground)

local topBar = display.newImage( "mainMenuAssets/TopBar.png" )
topBar.x = _W*0.5
topBar.y = 38 
mainGroup:insert(topBar)

local catagoryBtn1 = display.newImage( "mainMenuAssets/Button.png" )
catagoryBtn1.x = _W*0.5
catagoryBtn1.y = 193
mainGroup:insert(catagoryBtn1)

local catagoryBtn2 = display.newImage( "mainMenuAssets/Button.png" )
catagoryBtn2.x = _W*0.5
catagoryBtn2.y = catagoryBtn1.y + 218
--catagoryBtn2.alpha = 0.5
mainGroup:insert(catagoryBtn2)

local catagoryBtn3 = display.newImage( "mainMenuAssets/Button.png" )
catagoryBtn3.x = _W*0.5
catagoryBtn3.y = catagoryBtn2.y + 218
mainGroup:insert(catagoryBtn3)

local catagoryBtn4 = display.newImage( "mainMenuAssets/Button.png" )
catagoryBtn4.x = _W*0.5
catagoryBtn4.y = catagoryBtn3.y + 218
--catagoryBtn4.alpha = 0.5
mainGroup:insert(catagoryBtn4)

local catagoryBtn5 = display.newImage( "mainMenuAssets/Button.png" )
catagoryBtn5.x = _W*0.5
catagoryBtn5.y = catagoryBtn4.y + 218
mainGroup:insert(catagoryBtn5)

mainMenuShade = display.newRect( _W*0.5, _H*0.5+48, _W, _H-96 )
mainMenuShade:setFillColor( 0/255,0/255,0/255 )
mainMenuShade.alpha = 0
mainGroup:insert(mainMenuShade)

mainMenuSideButton = display.newRect( 0, 48, 200, 96 )
mainMenuSideButton:setFillColor( 255/255,255/255,255/255 )
mainMenuSideButton.alpha = 0.01
mainGroup:insert(mainMenuSideButton)



-- SideBar Assets

sideBarBackground = display.newRect( _W*0.5, _H*0.5+48, 576, _H-96 )
sideBarBackground:setFillColor( 229/255,229/255,229/255 )
sideBarBackground.x = _W*0.5 - 72
--sideBarBackground.alpha = 0.01
sideBarGroup:insert(sideBarBackground)

sideBarSwipe = display.newRect( _W*0.5, _H*0.5+48, 300, _H-96 )
sideBarSwipe:setFillColor( 255/255,255/255,255/255 )
sideBarSwipe.x = sideBarBackground.x + 608/2
sideBarSwipe.alpha = 0.01
sideBarGroup:insert(sideBarSwipe)

sideBarText1 = display.newText( "Trending", 0, 170, native.systemFontBold, 40 )
sideBarText1:setFillColor( 80/255, 80/255, 80/255 )
sideBarText1.x = sideBarBackground.x - 180
sideScrollGroup:insert(sideBarText1)

sideBarText2 = display.newText( "Rate This Place", 0, sideBarText1.y + 140, native.systemFont, 40 )
sideBarText2:setFillColor( 80/255, 80/255, 80/255 )
sideBarText2.x = sideBarBackground.x - 118
sideScrollGroup:insert(sideBarText2)

sideBarText3 = display.newText( "My Top Five", 0, sideBarText2.y + 140, native.systemFont, 40 )
sideBarText3:setFillColor( 80/255, 80/255, 80/255 )
sideBarText3.x = sideBarBackground.x - 145
sideScrollGroup:insert(sideBarText3)

sideBarText4 = display.newText( "Rate Me", 0, sideBarText3.y + 140, native.systemFont, 40 )
sideBarText4:setFillColor( 80/255, 80/255, 80/255 )
sideBarText4.x = sideBarBackground.x - 185
sideScrollGroup:insert(sideBarText4)



end

--------------------

function scene:enterScene( event )
local sideBarState = "closed"

local function mainSideButtonFunc(event)
	if event.phase == "began" then
	mainMenuSideButton.alpha = 0.5
	elseif event.phase == "ended" and sideBarState == "closed" then
		sideBarState = "open"
		print(sideBarState)
		transition.to(sideBarGroup, { time=150,x = 0 , transition=easing.outQuad })
		transition.to(sideScrollGroup, { time=150,x = 0 , transition=easing.outQuad })
		transition.to(mainMenuShade, { time=200, alpha = 0.5 })
		mainMenuSideButton.alpha = 0.01
	elseif event.phase == "ended" and sideBarState == "open" then
		sideBarState = "closed" 
		print(sideBarState)
		transition.to(sideBarGroup, { time=200,x = -576 , transition=easing.outQuad })
		transition.to(sideScrollGroup, { time=200,x = -576 , transition=easing.outQuad })
		transition.to(mainMenuShade, { delay = 50, time=100, alpha = 0 })
		mainMenuSideButton.alpha = 0.01
	end
end
mainMenuSideButton:addEventListener("touch", mainSideButtonFunc)


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
					transition.to(sideBarGroup, { time=150,x = -576 , transition=easing.outQuad })
					transition.to(sideScrollGroup, { time=150,x = -576 , transition=easing.outQuad })
					transition.to(mainMenuShade, { delay = 50, time=100, alpha = 0 })
                    print("swipe left")
				end
                else 
					if sideBarState == "closed" then
					sideBarState = "open"
					print(sideBarState)
					transition.to(sideBarGroup, { time=150,x = 0 , transition=easing.outQuad })
					transition.to(sideScrollGroup, { time=150,x = 0 , transition=easing.outQuad })
					transition.to(mainMenuShade, { time=200, alpha = 0.5 })
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
								if sideBarState == "closed" then
				transition.to(mainMenuShade, { time=100, alpha = 0.1 })
        end
        end
        
        if event.phase == "ended"  then
                endX = event.x
                endY = event.y
                checkSwipeDirection();
        end
end
 
sideBarSwipe:addEventListener("touch", swipe) -- Runtime


local function sideSwipe( event )
	local t = event.target

	local phase = event.phase
	if "began" == phase then
		t.isFocus = true
		
		-- Store initial position

		sideBarGroup.x0 = event.x - sideBarGroup.x
		sideScrollGroup.x0 = event.x - sideScrollGroup.x
	elseif t.isFocus then
		if "moved" == phase then
			sideBarGroup.x = event.x - sideBarGroup.x0
			sideScrollGroup.x = event.x - sideScrollGroup.x0
			--[[
			if sideBarGroup.x < 100 then
				print"1"
				transition.to(mainMenuShade, { time=50, alpha = 0.1 })
					elseif sideBarGroup.x > 100 and sideBarGroup.x < 200 then
					print"2"
					transition.to(mainMenuShade, { time=50, alpha = 0.2 })
					elseif sideBarGroup.x > 200 and sideBarGroup.x < 300 then
					print"3"
					transition.to(mainMenuShade, { time=50, alpha = 0.3 })
					elseif sideBarGroup.x < 100 then
					print"4"
					transition.to(mainMenuShade, { time=50, alpha = 0 })
				end
			--]]
		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus( nil )
			t.isFocus = false

		end
	end
end
sideBarSwipe:addEventListener("touch", sideSwipe)




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