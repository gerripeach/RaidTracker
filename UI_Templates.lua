﻿-- Author      : chris
-- Create Date : 11/2/2008 4:20:44 PM

RT_Templates = {

}
                                     

function RT_Templates:FireEvent( frame, sHandler, ... )
	if not frame then return true; end

	local parent = frame:GetParent()
	local script = parent and parent:GetScript(sHandler);    
    local retval = script and script(parent, ...)
	--RaidTracker:Debug("Fire event ", parent and parent:GetName(), frame and frame:GetName(), sHandler, script, retval, ... )
    
    return retval
end


function RT_Templates:InitWidgets( frame, handler, info )
	local L = RaidTracker.L
	local s = frame:GetName()
   	for k,v in pairs(info) do
 		local e = getglobal(s .. "_" .. v.name)
 		if e then
 			if v.title then
 				e.title = v.title
 				local f = getglobal(e:GetName().."Title"); if f then f:SetText(L[v.title]..":") end
 			end
 			if v.opts then e._opts = v.opts end
 			if v.desc then e.text = L[v.desc] end
 			if v.desc2 then e.text = e.text .. "\n\n" .. info[v.desc2].desc end
 			e._handler = handler
 		end
 	end
end


function RT_Templates:SliderOnUpdate( frame, time )
	local rt = RaidTracker
	local L = rt.L
	if frame.title then
		local f = frame._fstitle
		if not f then
			f = frame:CreateFontString( nil, "BACKGROUND", "GameFontHighlightSmall" ); frame._fstitle = f
			f:SetPoint("RIGHT", frame, "LEFT", -8, 0); f:SetTextHeight(10)
		end
		f:SetText(L[frame.title])
--		rt:Debug("slider onupdate",frame.title)
	end
	local f = frame._fsvalue
	if not f then
		f = frame:CreateFontString( nil, "BACKGROUND", "GameFontHighlightSmall" ); frame._fsvalue = f
		f:SetPoint("LEFT", frame, "RIGHT", 10, 0); f:SetTextHeight(10)
	end
	if frame._opts then
		local s = L[frame._opts[frame:GetValue()]]
		f:SetText(s or frame:GetValue())
	else
		f:SetText(frame:GetValue())
	end
end