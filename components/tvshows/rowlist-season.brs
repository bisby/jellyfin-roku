sub init()
    m.top.itemComponentName = "ListPoster"
    m.top.content = getData()

    'm.top.rowFocusAnimationStyle = "floatingFocus"
    'm.top.vertFocusAnimationStyle = "floatingFocus"

    m.top.showRowLabel = [true]
    m.top.rowLabelOffset = [0, 20]

    updateSize()

    m.top.observeField("rowItemSelected", onItemSelect)
    m.top.observeField("itemSelected", onItemSelect)
end sub

sub updateSize()
    ' Infinite scroll, rowsize is just how many show on screen at once
    m.top.rowSize = 5

    dimensions = m.top.getScene().currentDesignResolution

    m.top.translation = [119, 155]

    textHeight = 80
    ' Do we decide width by rowSize, or rowSize by width...
    itemWidth = 240
    itemHeight = itemWidth * 1.5 + textHeight

    m.top.visible = true

    ' size of the whole row
    ' account for border AND panel "left position"
    m.top.itemSize = [1920 - (238 + 150), itemHeight]
    ' spacing between rows
    m.top.itemSpacing = [ 0, 10 ]

    ' size of the item in the row
    m.top.rowItemSize = [ itemWidth, itemHeight ]
    ' spacing between items in a row
    m.top.rowItemSpacing = [ 0, 0 ]

end sub

function getData()
    if m.top.TVSeasonData = invalid then
        data = CreateObject("roSGNode", "ContentNode")
        return data
    end if

    seasonData = m.top.TVSeasonData
    data = CreateObject("roSGNode", "ContentNode")
    row = data.CreateChild("ContentNode")
    row.title = "Seasons"
    for each item in seasonData.items
        row.appendChild(item)
    end for
    m.top.content = data
    return data
end function

function onKeyEvent(key as string, press as boolean) as boolean
  if not press then return false


  if key = "right"
    ' TODO - if on the last element capture and do nothing
    return false
  end if

  return false
end function

function onItemSelect()
  print m.top.rowItemSelected
  print m.top.itemSelected
  print m.top.rowItemFocused
  print m.top.itemFocused

end function
