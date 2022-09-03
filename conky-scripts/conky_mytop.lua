local file = io.popen("grep -c processor /proc/cpuinfo")
local numcpus = file:read("*n")
file:close()
listinfo = "NAME\t\t      PID   CPU%   MEM%\n"
for j = 1,numcpus
  do listinfo = listinfo.."${top name "..tostring(j).."} ${top pid "..tostring(j).."} ${top cpu "..tostring(j).."} ${top mem "..tostring(j).."}\n"
end

function conky_mytop()
  return listinfo
end
