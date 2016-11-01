
do
function run(msg, matches)
      if msg.reply_id and is_momod (msg) then
      delete_msg(msg.id, ok_cb, false)
    delete_msg(msg.reply_id, ok_cb, false)
      else
    return 
    end
end

return {
    description = "delete messages by reply by Ev", 
    usage = "",
    patterns = {
      "^/clear$"
    }, 
    run = run 
}
end
