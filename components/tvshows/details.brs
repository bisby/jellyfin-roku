sub init()
    set = m.top.findNode("panelset")
    set.height = 1080

    panel = set.findNode("panel-desc")
    panel.panelSize = "full"
    panel.hasNextPanel = true
    panel.isFullScreen = true
    panel.leftPosition = 150

    panel2 = set.findNode("panel-seasons")
    panel2.panelSize = "full"
    panel2.hasNextPanel = false
    panel2.isFullScreen = true
    panel2.leftPosition = 150
end sub

sub panelFocusChanged()
    set = m.top.findNode("panelset")
    index = m.top.panelFocused

    print index
    print set.focusedChild

    if index = 0
        ' Description page
        ' TODO - get the buttons to actually take focus back
        m.top.findNode("description").findNode("buttons").setFocus(true)
        print "SETTING FOCUS"
    else if index = 1
        ' Seasons page
        m.top.findNode("seasons").setFocus(true)
    end if

end sub