local xx = 520;
local yy = 450;
local xx2 = 820;
local yy2 = 450;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;
local endstops = 0
local endrand = 0
function onUpdatePost()
    
   
    if endstops == 1 and getProperty('endingSong') then
       
      if keyJustPressed('accept') then endSong() end
        
    end
    
    
end

local allowCountdown = false;
local playDialogue = false;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('ManifestCutscene');
		allowCountdown = true;
		playDialogue = true;
		return Function_Stop;
	elseif playDialogue then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		playDialogue = false;
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
    endstops = endstops + 1
    if isStoryMode then
        if endstops == 1 then
            
            
            runTimer('endshit',1)
            
            return Function_Stop;
            
        end
    end
    return Function_Continue;
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'manifest');
	end
	if tag == 'endshit' then
        setProperty('camHUD._fxFadeAlpha', 0);
        cameraFlash('hud','000000',1)
        endrand = math.random(1, 100)

        if endrand >= 30 then

            if rating >= 0.8 then
		    	makeLuaSprite('endcock','ending0002')
            elseif rating <= 0.8 then
		    	makeLuaSprite('endcock','ending0001')
            end

        else
            makeLuaSprite('endcock','ending0003')
	    end
        addLuaSprite('endcock',true)
        setObjectCamera('endcock','camHUD')
    end
end
local allowCountdown = false