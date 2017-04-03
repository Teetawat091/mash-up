require("google-translate")
JSON = require("json")
local widget =  require("widget")
local txtfield
local button
local cx = display.contentCenterX
local cy = display.contentCenterY
local trans
local head

head = display.newText("TH-EN DICTIONARY",cx,cy-200,"Arail",25)
head:setFillColor(0,0,0)
txtfield = native.newTextField(cx,cy-30,150,30)
txtfield.align = "center"
 trans = display.newText("",cx,cy+30,"Arail",18)
 trans:setFillColor(0,0,0)

button = widget.newButton({x = cx , y = cy+120,
		       
		       defaultFile = "ok.png",
		       	      width = 120,
            height = 60})

function btnevent( event )

	if(event.phase == "ended")then
	if not(txtfield.text == "")then
		print("clicked")
		translate(txtfield.text,"en")
	end
end
	-- body
end
function translate(text,lang)
	
	local url = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170403T024841Z.a6761e4f32308f79.52744831b6b9eae903f5509af83d3bd97807ed4b&text="..text.."&lang="..lang
	print(url)
	network.request(
	url,
	"GET",
	prints
	)
end

function prints( event)
	local resp = JSON.decode(event.response)
	print(resp["text"][1])
	trans.text = resp["text"][1]
	reqspeech(trans.text)
	-- body
end

function reqSpeechListener(event)
if not(event.isError)then
audio.play(audio.loadSound(event.response.filename,system.TemporaryDirectiory))
else
	print("can't play this file")

end
end

function reqspeech(text)
local url = "http://localhost:8080/txttosp.php"
print(url)

network.download(
	url,
	"GET",
	reqSpeechListener,
	{text},
	text..".mp3",
	system.TemporaryDirectory
)

end



display.setDefault("background",255/255,195/255,20/255)


	button:addEventListener("touch",btnevent)

