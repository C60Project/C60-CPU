local function run(msg, matches)
  if is_chat_msg(msg) then
    local text = [[‌●C60-CPU Normal Groups commands
✅Gp Control
#- close|open link
#- close|open member
#- close|open name
#- close|open bot
#- close|open photo
#- close|open sticker
#- close|open file 
#- close|open audio


✅Gp Manager
#- kick : by <reply|id|username>
#- ban : by <reply|id|username>
#- unban : by <reply|id|username>
#- kickme


✅Gp Moderator
#- rules
#- setrules <write rules>
#- about
#- setabout <write about>
#- setphoto : then send photo
#- setname <write name>
#- id
#- id chat
#- group settings 
#- getlink : send link in your pv
#- relink <idchat> : change link group and send new link your pv
#- modlist
#- help
#- spromote : up leader by <reply|id|username> 
#- sdemote : in promote by <reply|id|username>
#- promote : by <reply|id|username> 
#- demote : by <reply|id|username> 

☑ @C60_CPU ]]
    return text
  end
  if is_channel_msg(msg) then
    local text = [[‌‌●C60-CPU Super Groups commands
✅Gp Control
#- close|open link
#- close|open member
#- close|open name
#- close|open bot
#- close|open photo
#- close|open sticker
#- close|open file 
#- close|open audio
#- close|open talk

✅Gp Manager
#- kick : by <reply|id|username>
#- ban : by <reply|id|username>
#- unban : by <reply|id|username>
#- kickme


✅Gp Moderator
#- rules
#- setrules <write rules>
#- about
#- setabout <write about>
#- setphoto : then send photo
#- setname <write name>
#- id
#- id chat
#- group settings 
#- getlink : send link in your pv
#- relink <idchat> : change link group and send new link your pv
#- modlist
#- help
#- spromote : up leader by <reply|id|username> 
#- sdemote : in promote by <reply|id|username>
#- promote : by <reply|id|username> 
#- demote : by <reply|id|username> 


*Use |!| before each command
☑ @C60_CPU ]]
    return text
  else
    local text = [[aaa]]
    --return text
  end
end

return {
  description = "Help plugin. Get info from other plugins.  ", 
  usage = {
    "!help: Show list of plugins.",
  },
  patterns = {
    "^!help$",
  }, 
  run = run,
}
