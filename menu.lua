local storyboard = require "storyboard"
local scene = storyboard.newScene()
storyboard.removeScene( "newRating" )
--------------------

function scene:createScene( event )
local group = self.view

mainGroup = display.newGroup()
sideBarGroup = display.newGroup()
sideScrollGroup = display.newGroup()
sideBarGroup.x = -360
sideScrollGroup.x = -360


-- MainMenu Assets


local mainMenuBackground = display.newImage( "mainMenuAssets/MainMenuBackground.jpg" )
mainMenuBackground.y = _H*0.5
mainMenuBackground.x = _W*0.5
mainGroup:insert(mainMenuBackground)

local topBar = display.newImage( "mainMenuAssets/TopBar.png" )
topBar.x = _W*0.5
topBar.y = 38 






catagoryBtn1 = display.newImage( "mainMenuAssets/Button.png" )
catagoryBtn1.x = _W*0.5
catagoryBtn1.y = 193
mainGroup:insert(catagoryBtn1)

catagoryBtn2 = display.newImage( "mainMenuAssets/Button2.png" )
catagoryBtn2.x = _W*0.5
catagoryBtn2.y = catagoryBtn1.y + 218
--catagoryBtn2.alpha = 0.5
mainGroup:insert(catagoryBtn2)

catagoryBtn3 = display.newImage( "mainMenuAssets/Button3.png" )
catagoryBtn3.x = _W*0.5
catagoryBtn3.y = catagoryBtn2.y + 218
mainGroup:insert(catagoryBtn3)

catagoryBtn4 = display.newImage( "mainMenuAssets/Button4.png" )
catagoryBtn4.x = _W*0.5
catagoryBtn4.y = catagoryBtn3.y + 218
--catagoryBtn4.alpha = 0.5
mainGroup:insert(catagoryBtn4)

catagoryBtn5 = display.newImage( "mainMenuAssets/Button5.png" )
catagoryBtn5.x = _W*0.5
catagoryBtn5.y = catagoryBtn4.y + 218
mainGroup:insert(catagoryBtn5)

catagoryBtnCover = display.newImage( "mainMenuAssets/ButtonCover.png" )
catagoryBtnCover.x = _W*0.5
catagoryBtnCover.y = -1200
catagoryBtnCover.alpha = 1
mainGroup:insert(catagoryBtnCover)






mainMenuShade = display.newRect( _W*0.5, _H*0.5+96, _W, _H+24 )
mainMenuShade:setFillColor( 0/255,0/255,0/255 )
mainMenuShade.alpha = 0
mainGroup:insert(mainMenuShade)

mainMenuSideButton = display.newRect( 0, 38, 200, 96 )
mainMenuSideButton:setFillColor( 255/255,255/255,255/255 )
mainMenuSideButton.alpha = 0.01
mainGroup:insert(mainMenuSideButton)





foodPlaces = display.newImage( "mainMenuAssets/FoodPlaces.png" )
foodPlaces.y = _H*0.5+50
foodPlaces.x = _W*0.5+720
foodPlaces.alpha = 1

shopPlaces = display.newImage( "mainMenuAssets/SportsShopPlaces.png" )
shopPlaces.y = _H*0.5+50
shopPlaces.x = _W*0.5+720
shopPlaces.alpha = 1
--mainGroup:insert(foodPlaces)

foodBtnCover = display.newImage( "mainMenuAssets/ButtonCover.png" )
foodBtnCover.x = _W*0.5+720
foodBtnCover.y = 193
foodBtnCover.alpha = 0.01

shopBtnCover = display.newImage( "mainMenuAssets/ButtonCover.png" )
shopBtnCover.x = _W*0.5+720
shopBtnCover.y = 193
shopBtnCover.alpha = 0.01
--mainGroup:insert(foodBtnCover)

local topBar = display.newImage( "mainMenuAssets/TopBar.png" )
topBar.x = _W*0.5
topBar.y = 38 



-- SideBar Assets

sideBarBackground = display.newRect( _W*0.5, _H*0.5+96, _W*0.5, _H+24 )
sideBarBackground:setFillColor( 229/255,229/255,229/255 )
sideBarBackground.x = _W*0.5 - 180
--sideBarBackground.alpha = 0.01
sideBarGroup:insert(sideBarBackground)

sideBarSwipe = display.newRect( _W*0.5, _H*0.5+48, 220, _H-96 )
sideBarSwipe:setFillColor( 255/255,255/255,255/255 )
sideBarSwipe.x = sideBarBackground.x + 250
sideBarSwipe.alpha = 0.01
sideBarGroup:insert(sideBarSwipe)

sideBtn1 = display.newImage( "mainMenuAssets/SideButton.png" )
sideBtn1.x = _W*0.5*0.5
sideBtn1.y = 193
sideScrollGroup:insert(sideBtn1)

sideBtn2 = display.newImage( "mainMenuAssets/SideButton2.png" )
sideBtn2.x = _W*0.5*0.5
sideBtn2.y = sideBtn1.y +218
sideScrollGroup:insert(sideBtn2)

sideBtn3 = display.newImage( "mainMenuAssets/SideButton3.png" )
sideBtn3.x = _W*0.5*0.5
sideBtn3.y = sideBtn2.y +218
sideScrollGroup:insert(sideBtn3)

sideBtnCover = display.newImage( "mainMenuAssets/SideButtonCover.png" )
sideBtnCover.x = _W*0.5*0.5
sideBtnCover.y = 193
sideBtnCover.alpha = 0
sideScrollGroup:insert(sideBtnCover)




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
		transition.to(sideBarGroup, { time=200,x = -360 , transition=easing.outQuad }) --576
		transition.to(sideScrollGroup, { time=200,x = -360 , transition=easing.outQuad })
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
					transition.to(sideBarGroup, { time=150,x = -360 , transition=easing.outQuad })
					transition.to(sideScrollGroup, { time=150,x = -360 , transition=easing.outQuad })
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






local function goFoodPlaces (event)
if event.phase == "ended" then

	transition.to(foodPlaces, { time=300, x = _W*0.5, transition=easing.inOutQuad })
	transition.to(foodBtnCover, { time=300, x = _W*0.5, transition=easing.inOutQuad })
	transition.to(mainGroup, { time=300, x = -_W*0.5, transition=easing.inOutQuad })
	end
end

catagoryBtn1:addEventListener("touch", goFoodPlaces)

local function goShopPlaces (event)
if event.phase == "ended" then

	transition.to(shopPlaces, { time=300, x = _W*0.5, transition=easing.inOutQuad })
	transition.to(shopBtnCover, { time=300, x = _W*0.5, transition=easing.inOutQuad })
	transition.to(mainGroup, { time=300, x = -_W*0.5, transition=easing.inOutQuad })
	end
end

catagoryBtn2:addEventListener("touch", goShopPlaces)








local function mainMenuButtonCover (event)
if event.phase == "began" and sideBarState == "closed" then
	local t = event.target
	catagoryBtnCover.alpha = 0.2
	catagoryBtnCover.y = t.y
	catagoryBtnCover.x = t.x
	elseif event.phase == "ended" then
	catagoryBtnCover.alpha = 0
	end
end
catagoryBtn1:addEventListener("touch", mainMenuButtonCover)
catagoryBtn2:addEventListener("touch", mainMenuButtonCover)
catagoryBtn3:addEventListener("touch", mainMenuButtonCover)
catagoryBtn4:addEventListener("touch", mainMenuButtonCover)
catagoryBtn5:addEventListener("touch", mainMenuButtonCover)







local function goToRate (event)
	storyboard.gotoScene( "newRating" ) 
end

local function cleanUp (event)
	if event.phase == "ended" then
		mainGroup:removeSelf()
		sideBarGroup:removeSelf()
		sideScrollGroup:removeSelf()
		goToRate() 
	end
end
sideBtn2:addEventListener("touch",cleanUp)

local function sideButtonCover (event)
if event.phase == "began" then
	local t = event.target
	sideBtnCover.alpha = 0.2
	sideBtnCover.y = t.y
	sideBtnCover.x = t.x
	elseif event.phase == "ended" then
	sideBtnCover.alpha = 0
	end
end
sideBtn1:addEventListener("touch", sideButtonCover)
sideBtn2:addEventListener("touch", sideButtonCover)
sideBtn3:addEventListener("touch", sideButtonCover)



local function surfRider (event)
	if event.phase == "began" then
	foodBtnCover.alpha = 0.2
	elseif event.phase == "ended" then
	foodBtnCover.alpha = 0.01
	end
end
foodBtnCover:addEventListener("touch", surfRider)

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