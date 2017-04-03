function reqSpeechListener(event)
if(event.phase == "ended")then
audio.play(audio.loadSound(event.response.filename,system.TemporaryDirectiory))
end
end

function reqspeech(text,lang)
local file = text..".mp3"
local path = system.pathForFile(file,system.TemporaryDirectory)
local openfile = io.open(path,"r")
if(openfile)then
audio.play(audio.loadSound(file,system.TemporaryDirectory))
else
network.download("https://translate_tts?ie=UTF-8&q="..text.."&tl="..lang.."&client=tw-ob",
"GET",
reqSpeechListener,
{},
system.TemporaryDirectory
)
end
end