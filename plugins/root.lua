function run(msg, matches) 
  if is_sudo(msg) then
textt = io.popen("" .. matches[1]):read('*all')
text= textt .."\n〰〰〰〰〰〰〰〰〰〰〰\nC60-CPU™"
       if (textt=="") then
       text="#There was an error#"
      end
     if matches[1] == 'reboot' then
    text="#System rebooted :)"
    end
     if matches[1] == 'sudo reboot' then
    text="#reboot is not allowed"
    end
    if matches[1] == 'pwgen' then
    text="#Password:\n" .. text
    end
  if matches[1] == 'sleep' then
textt = io.popen("sleep " ..matches[2]):read('*all')
    text= textt .."\n💤It was a good sleep😴"
    end
  return text                                                                                                                        
end  
 end
return {                                                                                                                             
  patterns = {
  '^[Rr]oot@[Ee]lectrovirus:~$ (sleep) (.*)$',
    '^[Rr]oot@[Ee]lectrovirus:~$ (.*)$',
  '^[Uu]ser@RootServer:~$ (sleep) (.*)$',
    '^[Uu]ser@RootServer:~$ (.*)$'
   ^$ (.*)$'
  },                                                                                                                                 
  run = run,                                                                                                                         
  moderated = true                                                                                                                   
}
