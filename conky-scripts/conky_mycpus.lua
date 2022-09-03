local file = io.popen("grep -c processor /proc/cpuinfo")
local numcpus = file:read("*n")
file:close()
listcpus = ""
for i = 1, numcpus
  do listcpus = listcpus.."${cpubar cpu"..tostring(i).."}\n"
end

function conky_mycpus()
  return listcpus
end
