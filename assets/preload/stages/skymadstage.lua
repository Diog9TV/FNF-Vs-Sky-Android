function onCreate()
	makeAnimatedLuaSprite('thebg','bg_manifest',-300,-100)
	addAnimationByPrefix('thebg','bgflash','bg',24,false)
	addLuaSprite('thebg',false)
	setScrollFactor('thebg', 0.8, 0.8);
	scaleObject('thebg', 2.0,2.0)
	
	makeAnimatedLuaSprite('floor','floorManifest',-1750,-600)
	addAnimationByPrefix('floor','floorflash','floorManifest',24,false)
	addLuaSprite('floor',false)
	setScrollFactor('floor', 1.0, 1.0);
	scaleObject('floor',3.0,3.0)
end
function opponentNoteHit()
	if getPropertyFromGroup('notes',id,'dadNote') then
	objectPlayAnimation('thebg','bgflash')
	objectPlayAnimation('floor','floorflash')
	end
end
function goodNoteHit()
	if getPropertyFromGroup('notes',id,'bfNote') then
	objectPlayAnimation('thebg','bgflash')
	objectPlayAnimation('floor','floorflash')
	end
end