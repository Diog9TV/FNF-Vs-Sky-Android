function onCreate()
	makeAnimatedLuaSprite('thebg','bg_normal',-250,-100)
	addAnimationByPrefix('thebg','bgflash','bg',24,false)
	addLuaSprite('thebg',false)
	scaleObject('thebg', 2.0,2.0)
end
function opponentNoteHit()
	if getPropertyFromGroup('notes',id,'dadNote') then
	objectPlayAnimation('thebg','bgflash')
	end
end
function goodNoteHit()
	if getPropertyFromGroup('notes',id,'bfNote') then
	objectPlayAnimation('thebg','bgflash')
	end
end