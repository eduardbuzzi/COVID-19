#!/bin/bash
echo
curl -s -C - -o covid19 https://www.worldometers.info/coronavirus/
curl -s -C - -o covid19brasil https://www.worldometers.info/coronavirus/country/brazil  
totalMUNDO=$(grep '<title>' covid19 | cut -d ':' -f2 | cut -d ' ' -f2)
totalMORTOS=$(grep '<title>' covid19 | cut -d ':' -f2 | cut -d ' ' -f5)
pais=$(grep '<title>' covid19brasil | cut -d '>' -f2 | cut -d ' ' -f1 | tr z s)
totalBRASIL=$(grep '<title>' covid19brasil | cut -d ':' -f2 | cut -d ' ' -f2)
totalMORTES=$(grep '<title>' covid19brasil | cut -d ':' -f2 | cut -d ' ' -f5)
totalRECUPERADO=$(grep color:#8ACA2B covid19brasil | cut -d '>' -f2 | cut -d '<' -f1 | tail -n1)
casosSUAVES=$(grep color:#8080FF covid19brasil | cut -d '>' -f2 | cut -d '<' -f1)
casosCRITICOS=$(grep color:red covid19brasil | cut -d '>' -f3 | cut -d '<' -f1)
rm covid19
rm covid19brasil
echo -e "CONTAMINADOS no MUNDO INTEIRO: \033[01;33m$totalMUNDO\033[01;00m"
echo -e "MORTOS no MUNDO INTEIRO: \033[01;31m$totalMORTOS\033[01;00m"
echo
echo -e "CONTAMINADOS no $pais: \033[01;33m$totalBRASIL\033[01;00m"
echo -e "MORTOS no $pais: \033[01;31m$totalMORTES\033[01;00m"
echo -e "RECUPERADOS no $pais: \033[01;32m$totalRECUPERADO\033[01;00m"
echo -e "Pacientes em condicoes SUAVES no $pais: \033[01;36m$casosSUAVES\033[01;00m"
echo -e "Pacientes em condicoes CRITICAS no $pais: \033[01;31m$casosCRITICOS\033[01;00m"
echo
exit
