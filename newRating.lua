local storyboard = require "storyboard"
local scene = storyboard.newScene()
storyboard.removeScene( "menu" )
--------------------

function scene:createScene( event )
local group = self.view

mainGroup = display.newGroup()
ratingGroup = display.newGroup()


-- MainMenu Assets


local mainMenuBackground = display.newImage( "mainMenuAssets/MainMenuBackground.jpg" )
mainMenuBackground.y = _H*0.5
mainMenuBackground.x = _W*0.5
mainGroup:insert(mainMenuBackground)

local topBar = display.newImage( "mainMenuAssets/TopBar.png" )
topBar.x = _W*0.5
topBar.y = 38 
mainGroup:insert(topBar)

local ratingImage = display.newImage( "ratingMenuAssets/5starRating.png" )
ratingImage.x = _W*0.5 + 720
ratingImage.y = _H*0.5 - 100
ratingGroup:insert(ratingImage)

local mainMenuBox = display.newRect( _W*0.5, _H*0.5, 510, 654 )
mainMenuBox:setFillColor( 255/255,255/255,255/255 )
ratingGroup:insert(mainMenuBox)

catagoryBtn = display.newImage( "ratingMenuAssets/RatePageButton.png" )
catagoryBtn.x = _W*0.5
catagoryBtn.y = _H*0.5-218
ratingGroup:insert(catagoryBtn)

placeBtn = display.newImage( "ratingMenuAssets/RatePageButton2.png" )
placeBtn.x = _W*0.5
placeBtn.y = catagoryBtn.y + 218
--catagoryBtn2.alpha = 0.5
ratingGroup:insert(placeBtn)

submitBtn = display.newImage( "ratingMenuAssets/RatePageButton3.png" )
submitBtn.x = _W*0.5
submitBtn.y = placeBtn.y + 218
ratingGroup:insert(submitBtn)

allDoneButton = display.newImage( "ratingMenuAssets/AllDoneButton.png" )
allDoneButton.x = _W*0.5/0.5-220+720
allDoneButton.y = 1045
ratingGroup:insert(allDoneButton)

allDoneButtonCover = display.newImage( "ratingMenuAssets/AllDoneButtonCover.png" )
allDoneButtonCover.x = _W*0.5/0.5-220+720
allDoneButtonCover.y = 1045
allDoneButtonCover.alpha = 0
ratingGroup:insert(allDoneButtonCover)


menuBtnCover = display.newImage( "ratingMenuAssets/RatePageButtonCover.png" )
menuBtnCover.x = _W*0.5*0.5
menuBtnCover.y = 193
menuBtnCover.alpha = 0
ratingGroup:insert(menuBtnCover)

mainMenuShade = display.newRect( _W*0.5, _H*0.5+96, _W, _H+24 )
mainMenuShade:setFillColor( 0/255,0/255,0/255 )
mainMenuShade.alpha = 0
mainGroup:insert(mainMenuShade)

mainMenuSideButton = display.newRect( 0, 38, 200, 96 )
mainMenuSideButton:setFillColor( 255/255,255/255,255/255 )
mainMenuSideButton.alpha = 0.01
mainGroup:insert(mainMenuSideButton)


end

--------------------

function scene:enterScene( event )



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
--sideBarSwipe:addEventListener("touch", swipe) -- Runtime

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
--sideBarSwipe:addEventListener("touch", sideSwipe)

local function submitRating (event)
if event.phase == "ended" then
	transition.to(ratingGroup, { time=300, x = -720, transition=easing.inOutQuad })
	end
end
submitBtn:addEventListener("touch", submitRating)

local function menuButtonCover (event)
if event.phase == "began" then
	local t = event.target
	menuBtnCover.alpha = 0.2
	menuBtnCover.y = t.y
	menuBtnCover.x = t.x
	elseif event.phase == "ended" then
	menuBtnCover.alpha = 0
	end
end
catagoryBtn:addEventListener("touch", menuButtonCover)
placeBtn:addEventListener("touch", menuButtonCover)
submitBtn:addEventListener("touch", menuButtonCover)


local function goToMenu (event)
	storyboard.gotoScene( "menu" ) 
end

local function cleanUp (event)
	if event.phase == "ended" then
		mainGroup:removeSelf()
		ratingGroup:removeSelf()
		goToMenu() 
	end
end
allDoneButton:addEventListener("touch",cleanUp)

local function allDoneButtonCoverFunc (event)
if event.phase == "began" then
	local t = event.target
	allDoneButtonCover.alpha = 0.2
	allDoneButtonCover.y = t.y
	allDoneButtonCover.x = t.x
	elseif event.phase == "ended" then
	allDoneButtonCover.alpha = 0
	end
end
allDoneButton:addEventListener("touch", allDoneButtonCoverFunc)

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