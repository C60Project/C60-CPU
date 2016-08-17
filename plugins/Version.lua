local function run(msg, matches)
  if is_chat_msg(msg) then
    local text = [[‌●C60-CPU Bot
#Based on tg-cli

#Sudo∶@Electrovirus

#Channel∶@C60_Project

#Product Bot∶@C60_Productbot

#Private source + Supergroup support
]]
    return text
  end
  if is_channel_msg(msg) then
    local text = [[‌‌●C60-CPU Bot
#Based on tg-cli

#Sudo∶@Electrovirus

#Channel∶@C60_Project

#Product Bot∶@C60_Productbot

#Private source + Supergroup support
 ]]
    return text
  else
    local text = [[aaa]]
    --return text
  end
end

return {
  description = "Bot version.  ", 
  usage = {
    "/version: Show bot version.",
  },
  patterns = {
    "^[/](version)$",
  }, 
  run = run,
}
