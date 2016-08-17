--Qr
local function get_hex(str)
  local colors = {
    red = "f00",
    blue = "00f",
    green = "0f0",
    yellow = "ff0",
    purple = "f0f",
    white = "fff",
    black = "000",
    gray = "ccc"
  }

  for color, value in pairs(colors) do
    if color == str then
      return value
    end
  end

  return str
end

local function qr(receiver, text, color, bgcolor)

  local url = "http://api.qrserver.com/v1/create-qr-code/?"
    .."size=600x600"  --fixed size otherways it's low detailed
    .."&data="..URL.escape(text:trim())

  if color then
    url = url.."&color="..get_hex(color)
  end
  if bgcolor then
    url = url.."&bgcolor="..get_hex(bgcolor)
  end

  local response, code, headers = http.request(url)

  if code ~= 200 then
    return "Oops! Error: " .. code
  end

  if #response > 0 then
	  send_photo_from_url(receiver, url)
	return

  end
  return "Oops! Something strange happened :("
end

local function run(msg, matches)
  local receiver = get_receiver(msg)

  local text = matches[1]
  local color
  local back

  if #matches > 1 then
    text = matches[3]
    color = matches[2]
    back = matches[1]
  end

  return qr(receiver, text, color, back)
end
--Calc
local function mathjs(exp)
  local url = 'http://api.mathjs.org/v1/'
  url = url..'?expr='..URL.escape(exp)
  local b,c = http.request(url)
  local text = nil
  if c == 200 then
    text = 'Result: '..b
  
  elseif c == 400 then
    text = b
  else
    text = 'Unexpected error\n'
      ..'Is api.mathjs.org up?'
  end
  return text
end

local function run(msg, matches)
  return mathjs(matches[1])
end
--Echo
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return text
end
--Time
function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local text = '🕒 ساعت '..jdat.FAtime..' \n📆 امروز '..jdat.FAdate..' میباشد.\n    —--\n🕒 '..jdat.ENtime..'\n📆 '..jdat.ENdate.. '\n@C60-CPU'
return text
end
--Stime
function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local url = "http://latex.codecogs.com/png.download?".."\\dpi{800}%20\\LARGE%20"..jdat.ENtime
local file = download_to_file(url,'time.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
end
--Weather
do

local BASE_URL = "http://api.openweathermap.org/data/2.5/weather"

local function get_weather(location)
  print("Finding weather in ", location)
  location = string.gsub(location," ","+")
  local url = BASE_URL
  url = url..'?q='..location
  url = url..'&units=metric'
  url = url..'&appid=bd82977b86bf27fb59a04b61b657fb6f'

  local b, c, h = http.request(url)
  if c ~= 200 then return nil end

  local weather = json:decode(b)
  local city = weather.name
  local country = weather.sys.country
  local temp = 'The temperature in '..city
    ..' (' ..country..')'
    ..' is '..weather.main.temp..'°C'
  local conditions = 'Current conditions are: '
    .. weather.weather[1].description

  if weather.weather[1].main == 'Clear' then
    conditions = conditions .. ' ☀'
  elseif weather.weather[1].main == 'Clouds' then
    conditions = conditions .. ' ☁☁'
  elseif weather.weather[1].main == 'Rain' then
    conditions = conditions .. ' ☔'
  elseif weather.weather[1].main == 'Thunderstorm' then
    conditions = conditions .. ' ☔☔☔☔'
  end

  return temp .. '\n' .. conditions
end

local function run(msg, matches)
  local city = 'Tehran,IR'

  if matches[1] ~= '/weather' then
    city = matches[1]
  end
  local text = get_weather(city)
  if not text then
    text = 'Can\'t get weather from that city.'
  end
  return text
end
end
end
return{
patterns = { 
    '^/qr "(%w+)" "(%w+)" (.+)$',
    "^/qr (.+)$",
    "^/calc (.*)$",
    "^/say(.+)$",
    "^[/]([Tt][iI][Mm][Ee])$",
    "^/time",
    "^/weather$",
    "^/weather (.*)$"
 }, 
run = run, 
} 
