-- Tables

local catagoryData = {}
catagoryData[1] = { name="Food" }
catagoryData[2] = { name="Shops" }
catagoryData[3] = { name="Spots" }
catagoryData[4] = { name="Fun Things" }
catagoryData[5] = { name="People"}

local function onCatagoryRowRender( event )

   --Set up the localized variables to be passed via the event table

   local row = event.row
   local id = row.index

   row.bg = display.newRect( 0, 0, display.contentWidth, 2 )
   row.bg.anchorX = 0 
   row.bg.anchorY = 0
   row.bg:setFillColor( 200/255, 200/255, 200/255 )
   row:insert( row.bg )

   row.nameText = display.newText( catagoryData[id].name, 12, 0, native.systemFont, 50)
   row.nameText.anchorX = 0
   row.nameText.anchorY = 0.5
   row.nameText:setFillColor( 0 )
   row.nameText.y = 40
   row.nameText.x = 42


   row:insert( row.nameText )
   return true
end

local function onCatagoryRowTouch (event)
	transition.to(catagoryGroup, { time=300, x = -720, transition=easing.inOutQuad })
	transition.to(mainMenuShade, { time=300, alpha = 0, transition=easing.inOutQuad })
end

local catagoryList = widget.newTableView {
   left = _W*0.5-275,
   top = 400,
   width = 550, 
   height = 400, 
   onRowRender = onCatagoryRowRender,
   onRowTouch = onCatagoryRowTouch,
   listener = scrollListener
}
catagoryGroup:insert( catagoryList )
for i = 1, #catagoryData do
   catagoryList:insertRow{
      rowHeight = 80,
      isCategory = false,
      rowColor = { 1, 1, 1 },
      lineColor = { 0.90, 0.90, 0.90 },
      params = {
         name = catagoryData[i].name,
      }
   }
end




local placesData = {}
placesData[1] = { name="Jack's Burgers" }
placesData[2] = { name="Surfrider Café" }
placesData[3] = { name="Taco Bell" }
placesData[4] = { name="Tam's Restaurant" }
placesData[5] = { name="El Jardín Restaurant"}

local function onPlaceRowRender( event )

   --Set up the localized variables to be passed via the event table

   local row = event.row
   local id = row.index

   row.bg = display.newRect( 0, 0, display.contentWidth, 2 )
   row.bg.anchorX = 0 
   row.bg.anchorY = 0
   row.bg:setFillColor( 200/255, 200/255, 200/255 )
   row:insert( row.bg )

   row.nameText = display.newText( placesData[id].name, 12, 0, native.systemFont, 50)
   row.nameText.anchorX = 0
   row.nameText.anchorY = 0.5
   row.nameText:setFillColor( 0 )
   row.nameText.y = 40
   row.nameText.x = 42


   row:insert( row.nameText )
   return true
end

local function onPlaceRowTouch (event)
	transition.to(placeGroup, { time=300, x = -720, transition=easing.inOutQuad })
	transition.to(mainMenuShade, { time=300, alpha = 0, transition=easing.inOutQuad })
end

local placeList = widget.newTableView {
   left = _W*0.5-275,
   top = 400,
   width = 550, 
   height = 400, 
   onRowRender = onPlaceRowRender,
   onRowTouch = onPlaceRowTouch,
   listener = scrollListener
}
placeGroup:insert( placeList )
for i = 1, #placesData do
   placeList:insertRow{
      rowHeight = 80,
      isCategory = false,
      rowColor = { 1, 1, 1 },
      lineColor = { 0.90, 0.90, 0.90 },
      params = {
         name = placesData[i].name,
      }
   }
end



end
