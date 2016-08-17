--9Gag
do

local function get_9GAG()
  local url = "http://api-9gag.herokuapp.com/"
  local b,c = http.request(url)
  if c ~= 200 then return nil end
  local gag = json:decode(b)
  -- random max json table size
  local i = math.random(#gag)
  local link_image = gag[i].src
  local title = gag[i].title
  if link_image:sub(0,2) == '//' then
    link_image = msg.text:sub(3,-1)
  end
  return link_image, title
end

local function send_title(cb_extra, success, result)
  if success then
    send_msg(cb_extra[1], cb_extra[2], ok_cb, false)
  end
end

local function run(msg, matches)
  local receiver = get_receiver(msg)
  local url, title = get_9GAG()
  send_photo_from_url(receiver, url, send_title, {receiver, title})
  return false
end

return {
  description = "9GAG for Telegram",
  usage = "!9gag: Send random image from 9gag",
  patterns = {"^/9gag$"},
  run = run
}

end

--Abjad
local numbers = {}
numbers['ا'] = 1
numbers['ب'] = 2
numbers['ج'] = 3
numbers['د'] = 4
numbers['ه'] = 5
numbers['و'] = 6
numbers['ز'] = 7
numbers['ح'] = 8
numbers['ط'] = 9
numbers['ی'] = 10
numbers['ک'] = 20
numbers['ل'] = 30
numbers['م'] = 40
numbers['ن'] = 50
numbers['س'] = 60
numbers['ع'] = 70
numbers['ف'] = 80
numbers['ص'] = 90
numbers['ق'] = 100
numbers['ر'] = 200
numbers['ش'] = 300
numbers['ت'] = 400
numbers['ث'] = 500
numbers['خ'] = 600
numbers['ذ'] = 700
numbers['ض'] = 800
numbers['ظ'] = 900
numbers['غ'] = 900
local function convert(text)
    local text = text:gsub('ژ','ز')
    local text = text:gsub('گ','ک')
    local text = text:gsub('چ','ج')
    local text = text:gsub('پ','ب')
    local text = text:gsub('ئ','ی')
    local text = text:gsub('آ','ا')
    local text = text:gsub('ۀ','ه')
    local text = text:gsub('ي','ی')
    local text = text:gsub('ة','ه')
    local text = text:gsub('ؤ','و')
    return text
end
local function abjad(text,num,str)
    local num = num
    local text = text
    if text:match(str) then
for word in string.gmatch(text, str) do num = num + numbers[str]
end
text = text:gsub(str,'')
end
return text , num
end
local function run(msg, matches)
       if not matches[2] or matches[2] == '' then
        return [[حروف جمل یا به عبارت دیگر حروف ابجد،نام مجموع صور هشتگانه حروف عرب است. این صور ازین قرار است: ابجد – هوز- حطي - کلمن - سعفص - قرشت - ثخذ - ضظغ.
ترتيب حروف (مراد،حروف صامت است) درين نسق همان ترتيب عبري آرامي است و اين امر با دلايل ديگر مؤید آنست که عرب الفباي خود را از آنان بوساطت نبطيان اقتباس کرده و شش حرف مخصوص عرب در آخر ترتيب ابجدي قرار داده شده است؛ علاوه برين ترتيب هشت کلمه تذکاريه که مفهومي ندارند با عبري و آرامي در اينکه حروف معرف اعدادند نيز شباهت دارد،از «همزه» تا «ی» نماينده ی 1تا10 ،«ک» تا «ق» نماینده ی 20تا100 و نه حرف آخر معرف 200تا1000 باشد. ابجد تجريد نوشتن (تصوف) ترک خواهش و آرزو کردن و از خودي و مزاحمت خواهش آمدن و از ماسوي الله مجرد گرديدن...
ا=1     ک=20     ش=300
ب=2     ل=30     ت=400
ج=3     م=40     ث=500
د=4     ن=50     خ=600
ه=5     س=60     ذ=700
و=6     ع=70     ض=800
ز=7     ف=80     ظ=900
ح=8     ص=90     غ=1000
ط=9      ق=100
ی=10     ر=200
]]
        end
    local text = convert(matches[2])
    local num = 0
text , num = abjad(text,num,'ا')
text , num = abjad(text,num,'ب')
text , num = abjad(text,num,'ج')
text , num = abjad(text,num,'د')
text , num = abjad(text,num,'ه')
text , num = abjad(text,num,'و')
text , num = abjad(text,num,'ز')
text , num = abjad(text,num,'ح')
text , num = abjad(text,num,'ط')
text , num = abjad(text,num,'ی')
text , num = abjad(text,num,'ک')
text , num = abjad(text,num,'ل')
text , num = abjad(text,num,'م')
text , num = abjad(text,num,'ن')
text , num = abjad(text,num,'س')
text , num = abjad(text,num,'ع')
text , num = abjad(text,num,'ف')
text , num = abjad(text,num,'ص')
text , num = abjad(text,num,'ق')
text , num = abjad(text,num,'ر')
text , num = abjad(text,num,'ش')
text , num = abjad(text,num,'ت')
text , num = abjad(text,num,'ث')
text , num = abjad(text,num,'خ')
text , num = abjad(text,num,'ذ')
text , num = abjad(text,num,'ض')
text , num = abjad(text,num,'ظ')
text , num = abjad(text,num,'غ')
if text ~= '' then
  return 'فقط زبان فارسی پشتیبانی میشود'  
end
return 'عدد ابجد کبیر : '..num
    end
  return {
patterns = {
    "^([/]abjad) (.*)$",
    "^([/]abjad)$"
  },
run = run
  }  
--Calculator
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

return {
  description = "Calculate math expressions with mathjs API",
  usage = "!calc [expression]: evaluates the expression and sends the result.",
  patterns = {
    "^/calc (.*)$"
  },
  run = run
}
--Qrcode
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

return {
  description = {"qr code plugin for telegram, given a text it returns the qr code"},
  usage = {
    "!qr [text]",
    '!qr "[background color]" "[data color]" [text]\n'
      .."Color through text: red|green|blue|purple|black|white|gray\n"
      .."Colors through hex notation: (\"a56729\" is brown)\n"
      .."Or colors through decimals: (\"255-192-203\" is pink)"
  },
  patterns = {
    '^/qr "(%w+)" "(%w+)" (.+)$',
    "^/qr (.+)$"
  },
  run = run
}
