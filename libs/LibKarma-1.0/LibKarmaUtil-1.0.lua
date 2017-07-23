-- ********* KarmaStub lib versioning 1.1 start *********
-- An alternative lib stub. Does not have an explicit upgrade path for major revisions.
-- In the case of the karma lib itself, it will polute 6 global vars total for all addons:
-- 4 lib sections, 1 stub, and in the util 1 common tooltip frame with a global name.
if not KarmaStub or not KarmaStub:isLib("KarmaStub", 1.1) then
	KarmaStub = {
		list = KarmaStub and KarmaStub.list or { KarmaStub = 1.1, },
		isLib = function(self, lib, major, minor)
			major = (major or 1) + (minor and tonumber(minor:match("%d+")) or 0) * 0.00000001
			if self.list[lib] and self.list[lib] >= major then return _G[lib] else self.list[lib] = major end
		end,
	}
end
-- ********* KarmaStub lib versioning 1.1 end ***********

if KarmaStub:isLib("LibKarmaUtil", 1.1, "$Revision: 61 $") then return end

--[[
	General Utility Functions	
]]

LibKarmaUtil = LibKarmaUtil or {

}

LibKarmaUtil._lookup = {
	ColorToRarity = {
		ff9d9d9d = 1, ffffffff = 2, ff1eff00 = 3, ff0070dd = 4, ffa335ee = 5, ffff8000 = 6, ffe6cc80 = 7,
	},
	ClassToId = {
		WARRIOR=1, ROGUE=2, HUNTER=3, PALADIN=4, SHAMAN=5, DRUID=6, WARLOCK=7, MAGE=8, PRIEST=9, DEATHKNIGHT = 10,
	},
	RaceToId = {
		Gnome=1, Human=2, Dwarf=3, NightElf=4, Troll=5, Scourge=6, Orc=7, Tauren=8,	Draenei=9, BloodElf=10,
	},
}
LibKarmaUtil._options = { DebugMode = 0, TimeDiff = 0, }



function LibKarmaUtil:ToStr( d, sz, ... )
	local c,s,t,v = select("#",...),""
	for i=1,c do
		v = select(i,...)
		t = type(v)
		s = s .. (t=="string" and ((sz and #v>sz) and (strsub(v,1,sz).."...") or v)
			or ((t=="number" or t=="boolean") and tostring(v) or ("["..t.."]")))
		if d and c~=i then s = s .. d end
  	end	
	return s
end

function LibKarmaUtil:Print( msg, r, g, b, frame, id, addToStart )
	(frame or DEFAULT_CHAT_FRAME):AddMessage(msg, r or 1, g or 1, b or 0, id or 0, addToStart)
end

function LibKarmaUtil:SysMsg( ... )
    self:Print(self:ToStr(" ",200,...), 1, 0.5, 0)
end

function LibKarmaUtil:Debug( ... )
    if self._options and self._options.DebugMode==1 then
		self:Print(self:ToStr("#",200,"  #",...).."#", 1, 0.5, 0)
		return true
	end
	return false
end

function LibKarmaUtil:InitWhisper( name, chatFunc )
	if not name then return end	
	chatFunc = chatFunc or ChatFrame_OpenChat
	local f = DEFAULT_CHAT_FRAME;
	local fe = f and f.editBox or nil; if not fe then return end 
	fe:SetAttribute("chatType", "WHISPER");	fe:SetAttribute("tellTarget", name)
	ChatEdit_UpdateHeader(fe)
	if chatFunc and not fe:IsVisible() then chatFunc("", f) end
end

function LibKarmaUtil:ArgsToTable( dst, ... )
	dst  = dst or { }
	for i = 1, select('#', ...), 2 do
		dst[select(i, ...)] = select(i+1, ...)
	end
	return dst
end

function LibKarmaUtil:TableSet( t, k, v, isCopy )
	if rawget(t, k) ~= v then
		if t[k] == v then v = self:TableCopy(v) end						-- exists
		t[k] = v
	end
	return v
end

function LibKarmaUtil:TableAddUnique( t, v )
	if type(t) ~= "table" then return end
	local found
	for k1, v1 in pairs(t) do
		if v == v1 then	found = true break end
	end 
	if not found then tinsert(t, v) end
end

function LibKarmaUtil:TableGetTables( t )
	local a,m = { }
	while type(t) == "table" and #a < 10 do
		tinsert(a, t)
		m = getmetatable(t)
		t = (m and m ~= t) and m.__index or nil
	end	
	return a
end

function LibKarmaUtil:TableGetKeys( t )
	local list, a = { }, self:TableGetTables(t)
	for i, v in ipairs( a ) do
		for k1, v1 in pairs( v ) do
			if type(v1)~="function" then
				self:TableAddUnique(list, k1)
			end
		end
	end
	return list, a
end

function LibKarmaUtil:TableGetValues( t, sort )
	local keys, list, list2, a = { }, { }, nil, self:TableGetTables(t)
	for i, v in ipairs( a ) do
		list2 = { }
		for k1, v1 in pairs( v ) do
			if type(v1)~="function" and not keys[k1] then
				keys[k1] = true
				tinsert( list2, v1 )
			end
		end
		if sort then table.sort(list2, sort) end
		for i1, v1 in ipairs(list2) do
			tinsert( list, v1 )
		end
	end
	return list
end

function LibKarmaUtil:DebugTable( ... )
    if not self:Debug(...) then return end
	for i=1, select("#", ...), 1 do
		local idx, a = self:TableGetKeys( select(i,...) )
		table.sort( idx, self.sortSafe )
		for k1, v1 in pairs( idx ) do
			local s = ""
			for k2, v2 in pairs( a ) do
				s = self:ToStr(":",200, s, rawget(v2, v1))
			end	
			self:SysMsg("    ", v1, "=", s )
		end
	end
end

function LibKarmaUtil:TableCopy( s )
	local lookup = { }
	local function _copy(s)
		if type(s) ~= "table" then return s
		elseif lookup[s] then return lookup[s] end
		local t = { }
		lookup[s] = t
		for i, v in pairs(s) do
			t[_copy(i)] = _copy(v)
		end
		return t
	end
	return _copy(s)
end

function LibKarmaUtil:TableMerge( d, s, ref )
 	if d ~= s and (not d or (s and ((type(d) == "table") == (type(s) == "table")))) then
		if type(s) ~= "table" or (ref and not d) then return s end
		if not d then d = { } end
		for i, v in pairs(s) do
			local isK = type(i) ~= "number"
			s = self:TableMerge((isK and d[i] or nil), v, ref)			--if s == v and type(s) == "table" then self:Debug("mref",i,d,s) end
			if isK then d[i] = s else tinsert( d, s ) end
		end
	end
	return d
end


function LibKarmaUtil.sortSafe(a,b)
	if tonumber(a) and tonumber(b) then
		return tonumber(a) < tonumber(b)
	elseif tostring(a) and tostring(b) then 
		return tostring(a) < tostring(b)
	end
	return false
end


local _timetable = { }
function LibKarmaUtil:GetTime( s, ts )						-- convert string, or now to timestamp
	local d
	if s then 
		d = _timetable
		_, _, d.month, d.day, d.year, d.hour, d.min, d.sec = s:find("(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)")
		if not d.year then return end
		if d.year:len() == 2 then d.year = "20" .. d.year end
	end
	s = time(d)
    return s and (s + (ts or 0)) or nil
end

function LibKarmaUtil:GetDate( n, tz, fmt )					-- convert timestamp,[tzoffset],[format], or now to formatted string
	n = (n or time()) + (tz and (tz * 3600) or 0)
	return date(fmt or "%m/%d/%y %H:%M:%S", n)
	-- alternate below, the above may be bugging on some EU installs
--	if fmt then return date(fmt, n) end
--	local t = date("*t", n); if not t then return end
--	return ""..t.month.."/"..t.day.."/"..(t.year % 100).." "..t.hour..":"..t.min..":"..t.sec
end

function LibKarmaUtil:GetGameTime( )
	local hour, minute = GetGameTime()						-- get game server time (current time of day for servers timezone)	
	return (hour * 3600) + (minute * 60)				
end

function LibKarmaUtil:GetSysTime( )
	local t = date("*t")									-- get computers time (current time of day for computers timezone)
	return (t.hour * 3600) + (t.min * 60) + t.sec
end

function LibKarmaUtil:GetTimeDiff( game, sys )
	local o = self._options
	if o and o.TimeDiff and IsInInstance() then	return o.TimeDiff end		
	game = game or self:GetGameTime();  sys = sys or self:GetSysTime()
	local t = 0
	if game >= sys then
		sys = game - sys
		t = sys + (sys >= (12*3600) and (-24*3600) or 0)
	elseif game < sys then
		sys = sys - game
		if sys >= (12*3600) then
			t = (24*3600) - sys
		else
			t = sys * -1
		end
	end
	if o and o.TimeDiff then self._options.TimeDiff = t end	
	return t
end


function LibKarmaUtil:HexToScale( s, o1, o2 )
	if o1 then s = s:sub(o1, o2) end
	local n = tonumber(s, 16)
	local divs = ((2^((s:len()/2)*8)) - 1)		--	self:Debug("HexToScale", s, n, divs, n/divs)
	return (n) and (n / divs) or 1
end

function LibKarmaUtil:ColorToRGB( s )
	local n = s and s:len() or 0
	if n < 6 then return 1,1,1 end
    return self:HexToScale(s,n-5,n-4), self:HexToScale(s,n-3,n-2), self:HexToScale(s,n-1,n)
end


function LibKarmaUtil:GetScanTooltip( )
	local f = Karma_ScanTooltip; if f then return f end
	f = CreateFrame( "GameTooltip", "Karma_ScanTooltip" )			-- tooltip name cannot be nil
	f:SetOwner( WorldFrame, "ANCHOR_NONE" )
	f.left, f.right = { }, { }
	for i = 1, 30 do
		f.left[i] = f:CreateFontString( "$parentTextLeft..i", nil, "GameTooltipText" )
		f.right[i] = f:CreateFontString( "$parentTextRight..i", nil, "GameTooltipText" )
		f:AddFontStrings( f.left[i], f.right[1] )
	end
	return f
end

function LibKarmaUtil:UnitZone( unit )
	if unit == "player" then return GetRealZoneText() end
	local f = self:GetScanTooltip()
	f:ClearLines()
	f:SetUnit(unit)
	local s = (f:NumLines()> 0) and f.left[f:NumLines()]:GetText() or nil
	if not s or s == PVP or s:find("^Level") then return end 
	return s
end

function LibKarmaUtil:UnitName( unit )
	local name,server = UnitName(unit)
	return name
end

function LibKarmaUtil:GetItemTooltip( link )
	local f, t = self:GetScanTooltip(), { }
	f:ClearLines()
	f:SetHyperlink( strfind(link,"^item:%d") and link or ("item:"..link) )
	for i = 1, f:NumLines() do
		tinsert(t, { left = f.left[i]:GetText(), right = f.right[i]:GetText() } )
	end
	return t
end

function LibKarmaUtil:SafeCall( f, ... )
	local e, r1, r2, r3, r4 = pcall( f, ... )
	if not e then self:Debug("SafeCall exception", r1); return end
	return r1, r2, r3, r4
end
