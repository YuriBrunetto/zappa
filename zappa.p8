pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function _init()
	gravity=100
	dt=1/60
	player={
		w=4,
		h=8,
		x=8,
		y=8,
		vel=0,
		onair=false,
		flipped=false
	}
end

function _update60()
	_input()
	
	local dy = gravity * dt
	if dy > 0 then
	 if collide(player, "down") then
	  dy=0
	 end
	end
	if dy < 0 then
	 if collide(player, "up") then
	  dy=0
	 end
	end
	
	player.y+=dy
		
end

function _draw()
	cls(1)
	map(0,0)
	spr(player_spr(),player.x,
	                 player.y)
end

function _input()
	if btn(0) then
	 player.x -= 1
	end
	if btn(1) then
		player.x += 1
	end
	if btn(2)
	and not player.onair then
	 gravity = -100
	 player.flipped = true
	end
	if btn(3)
 and not player.onair then
  gravity = 100
  player.flipped = false
 end
end

function player_spr()
	if player.flipped then
		return 3
	else
		return 2
	end
end
-->8
--collision
function collide(pl,aim)
	local x=pl.x local y=pl.y
	local w=pl.w local h=pl.h

	local x1=0 local y1=0
	local x2=0 local y2=0
	
	if aim=="left" then
   x1=x-1  y1=y
   x2=x    y2=y+h-1
 elseif aim=="right" then
   x1=x+w-1    y1=y
   x2=x+w  y2=y+h-1
 elseif aim=="up" then
   x1=x+2    y1=y-1
   x2=x+w-3  y2=y
 elseif aim=="down" then
   x1=x+2      y1=y+h
   x2=x+w-3    y2=y+h
 end

 --pixels to tiles
 x1/=8    y1/=8
 x2/=8    y2/=8
	
	if fget(mget(x1,y1),0)
	or fget(mget(x1,y2),0)
	or fget(mget(x2,y1),0)
	or fget(mget(x2,y2),0) then
  return true
	else
  return false
	end
end
__gfx__
00000000555555550000000000800800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000565566550000000000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700566555650000000000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770005565556500000000000aa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700055565555000aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700555555550008800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000556665650008800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555550080080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00080000330703307014070310503006016060110602e0502d05019050190502605024050190401a040200501f0401e0401c0401a0401a05018030170301603014030140301302011020210200f0200d0100c010
000c00001505017050190501c0501d0501c0501a0500b0500c0500e0501005012050130601c060210602605028050220501705017050180401a0401a0401b0401b04018030150301503015020170201d01022000
001000000c1500c1000c1500c1000c1500c1000c150182000c1501a1000c1500c1000c1500c1000c1500c1000c150182000c150001000c150182000c150001000c150182000c150001000c150182000c15000100
001000001f7500c7001f7500e700217501070022750117001f750137001f750157002175017700227500c7001f750007001f75000700217501770022750007001f750007001f7500070021750177002275000000
001000000c6100c6000c6100c6000c6400c6000c640186000c6101a6000c610006000c6400c6000c6400c6000c6100c6000c610186000c6401a6000c640006000c6100c6000c6100c6000c6400c6000c64018200
001000000073000700007300070000730007000073000700007300270000730007000073000700007300070000730007000073000700007300070000730007000073000700007300070000730007000073000700
__music__
03 02030405

