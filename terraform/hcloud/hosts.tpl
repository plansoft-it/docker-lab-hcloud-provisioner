[lab_hosts]
%{ for ip in ipv4_address ~}
${ip}
%{ endfor ~}
