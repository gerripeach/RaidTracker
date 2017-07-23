if KarmaStub:isLib("LibKarmaUI", 1.1, "$Revision: 53 $") then return end

--[[
	Simple integrated automated lightweight support for UI contructs
	
	This emulates basic blizz functionality buried deep in the blizz ui
	code, most of which is standard practice for the blizz ui.
]]


LibKarmaUI = LibKarmaUI or {

}

-- binds the ui instance to this lib ui base and to km addon instance
--	this allows derived ui code to belong to more than one app
function LibKarmaUI:GetInstance( _inst, inst )
	inst = inst or { }										-- make ui inst if none
	inst._super = self;										-- set ref to ui global as super
	inst._karma = _inst or LibKarmaUtil						-- add ref to app inst or at least util if there is none
	return setmetatable( inst, { __index = self } )			-- hook global as super class
end

--[[
function LibKarmaUI:Menu_Init( frame, parent, style )
	local name = frame:GetName().."RightClickMenu"
	UIDropDownMenu_Initialize(getglobal(name), function(...) self[name](self,...) end, style)
end
]]


function LibKarmaUI:Menu_Toggle( frame )
	local t = frame.rcmenu or getglobal(frame:GetName().."RightClickMenu")
	if not t then return end
	t.point = "TOPLEFT"
	t.relativePoint = "BOTTOMLEFT"
	ToggleDropDownMenu(1, nil, t, "cursor", 0, 0)
	return true
end

function LibKarmaUI:OnUpdate( frame )
	if frame.hasItem and GameTooltip:IsOwned(frame) then
		self:OnEnter(frame)
	end
end

function LibKarmaUI:OnClick( frame, button )
	local parent = frame._parent or frame:GetParent()

	if frame.hasItem and self:ShowItemTooptip(frame, parent, button) then
		return true
	end
	
	if button == "LeftButton" then
	elseif button == "RightButton" then
		if self:Menu_Toggle(parent) then return true end
	end
end

function LibKarmaUI:OnEnter( frame, title, text, useTT )
	local parent = frame._parent or frame:GetParent()
	title = title or frame.title; text = text or frame.text
	local f

	f = frame.type and getglobal(parent:GetName().."MouseOver_"..frame.type) or nil; if f then f:Show() end		
	f = getglobal(parent:GetName().."MouseOver"); if f then f:Show() end
	
	if frame.hasItem then
		self:ShowItemTooptip(frame, parent)
		CursorUpdate(frame)
	elseif (frame.hasTooltip and title and useTT) or text then
		f = GameTooltip
		f:SetOwner(frame, (type(frame.hasTooltip)=="string") and frame.hasTooltip or "ANCHOR_RIGHT")
		f:ClearLines()
		f:AddLine(title)
		if text then f:AddLine(text, 0.9, 0.9, 0.9, 1) end
		f:Show()
	end
end

function LibKarmaUI:OnLeave( frame )
	local parent = frame._parent or frame:GetParent()
	
	local f = frame.type and getglobal(parent:GetName() .. "MouseOver_"..frame.type); if f then f:Hide() end
	if not parent.selected then
		f = getglobal(parent:GetName() .. "MouseOver"); if f then f:Hide() end
	end

	if frame.hasItem then
		ResetCursor()
	end
	if GameTooltip:IsOwned(frame) then
		GameTooltip:Hide()
	end
end

function LibKarmaUI:OnShow( frame )
	local parent = frame._parent or frame:GetParent()

	if parent.selected then
		local f = getglobal(parent:GetName() .. "MouseOver"); if f then f:Show() end
	end
end

function LibKarmaUI:ShowItemTooptip( frame, parent, button )
	if not frame or not parent then return end
	local item = frame.item or parent.item
	if not item then return end

	local sName,sLink,_,_,_,sClass,sSubClass = GetItemInfo("item:" .. item.id)	
	if button == "LeftButton" then
		if IsModifiedClick("DRESSUP") and item.id then
			if sName then DressUpItemLink(sLink) end
			return true
		end
		if IsModifiedClick("CHATLINK") and item.id then
			if sName then ChatEdit_InsertLink(sLink) end
			return true
		end
		return false
    end

	local f = GameTooltip
	f:SetOwner(frame, "ANCHOR_BOTTOMRIGHT")
	if sName or button == "RightButton" then
		f:SetHyperlink("item:" .. item.id)
	else
		f:AddLine(item.name, self._karma:ColorToRGB(item.c))
		f:AddLine("This item is not in your cache, right-click to try to retrieve the item.", 1, 1, 1, 1)
		f:AddLine("Warning: This may result in a disconnect!", 1, 0, 0)
	end
	if self.ShowItemTooptipCustom then self:ShowItemTooptipCustom( frame, parent, item, sClass, sSubClass ) end
	f:Show()
	return button == "RightButton"
end


function LibKarmaUI:GenerateMinimapButton( frame, handler, options )

	LibKarmaUI._minimap = LibKarmaUI._minimap or {
		OnMouseDown	= function(self) self.icon:SetTexCoord(0, 1, 0, 1) end,
		OnMouseUp	= function(self) self.icon:SetTexCoord(0.075, 0.925, 0.075, 0.925) end,
		OnDragStart	= function(self) self._ismoving = true end,
		OnDragStop	= function(self) self.icon:SetTexCoord(0.075, 0.925, 0.075, 0.925); self._ismoving = false end,
		OnClick		= function(self, button) local h=self._handler return h.OnClick and h.OnClick(self,button) end,
		OnEnter		= function(self, button) local g,h=GameTooltip,self._handler
			g:SetOwner(self,"ANCHOR_RIGHT"); g:ClearLines(); if h.OnTooltipShow then h.OnTooltipShow(g) end; g:Show() end,
		OnLeave		= function(self, button) GameTooltip:Hide() end,
		OnUpdate	= function(self) if self._ismoving then
				local cx, cy = GetCursorPosition()
				local x, y = Minimap:GetCenter()
				local es = Minimap:GetEffectiveScale()
				self:Reposition( math.deg(math.atan2(y*es-cy, x*es-cx))+180 )
			 end end,
		OnShow		= function(self) self._options.show = 1 end,
		OnHide		= function(self) self._options.show = 0 end,
		Reposition	= function(self, a)
				local o = self._options
				if o.show ~= true and o.show ~= 1 then self:Hide(); return end
				a = a or o.position; o.position = a
				self:Show()
				self:ClearAllPoints()
				self:SetPoint("CENTER", Minimap, "CENTER", (Minimap:GetWidth()/2+10)*cos(a), (Minimap:GetHeight()/2+10)*sin(a))
			end,
	}

	local m = CreateFrame("Button", "", Minimap)
	m._ismoving = false
	m._handler = handler
	m._options = options
	m:SetToplevel(true); m:SetMovable(true); m:SetFrameStrata("LOW")
	m:SetWidth(20);	m:SetHeight(20)
	m:SetPoint("RIGHT", Minimap, "LEFT", 0,0)
	m.icon = m:CreateTexture("", "BACKGROUND")
	m.icon:SetTexture(handler.icon)
	m.icon:SetTexCoord(0.075, 0.925, 0.075, 0.925)
	m.icon:SetWidth(20); m.icon:SetHeight(20)
	m.icon:SetPoint("TOPLEFT", m, "TOPLEFT", 0, 0)
	m.mask = m:CreateTexture("", "OVERLAY")
	m.mask:SetTexture("Interface\\Minimap\\Minimap-TrackingBorder")
	m.mask:SetTexCoord(0.0, 0.6, 0.0, 0.6)
	m.mask:SetWidth(36); m.mask:SetHeight(36)
	m.mask:SetPoint("TOPLEFT", m, "TOPLEFT", -8, 8)
	m:RegisterForClicks("LeftButtonUp","RightButtonUp")
	m:RegisterForDrag("LeftButton")
	m:SetScript("OnMouseUp", self._minimap.OnMouseUp )
	m:SetScript("OnDragStart", self._minimap.OnDragStart )
	m:SetScript("OnDragStop", self._minimap.OnDragStop )
	m:SetScript("OnClick", self._minimap.OnClick )
	m:SetScript("OnEnter", self._minimap.OnEnter )
	m:SetScript("OnLeave", self._minimap.OnLeave )
	m:SetScript("OnUpdate", self._minimap.OnUpdate )
	m:SetScript("OnShow", self._minimap.OnShow )
	m:SetScript("OnHide", self._minimap.OnHide )
	m.Reposition = self._minimap.Reposition

	return m
end
