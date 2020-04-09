#!/bin/bash
echo
dia=$(date +%d)
mes=$(date +%m)
ano=$(date +%Y)
hora=$(date +%H)
minuto=$(date +%M)
echo "$dia/$mes/$ano $hora:$minuto"
echo
echo -e "Script \033[01;34mnetc4t\033[01;00m criado por: \033[01;32mEduardo Buzzi\033[01;00m"
echo -e "Mais Scripts em: \033[01;31mhttps://github.com/eduardbuzzi\033[01;00m"
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
echo >> .estatistica
echo "$dia/$mes/$ano $hora:$minuto" >> .estatistica
echo >> .estatistica
echo "$totalMUNDO" >> .estatistica
echo "$totalMORTOS" >> .estatistica
echo "$totalBRASIL" >> .estatistica
echo "$totalMORTES" >> .estatistica
echo "$totalRECUPERADO" >> .estatistica
echo "$casosSUAVES" >> .estatistica
echo "$casosCRITICOS" >> .estatistica
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
DATAultimaexec=$(cat .estatistica | tail -n19 | head -n1)
DATAatualexec=$(cat .estatistica | tail -n9 | head -n1)
totalMUNDOultimaexec=$(cat .estatistica | tr -d ',' | tail -n17 | head -n1)
totalMUNDOatualexec=$(cat .estatistica | tr -d ',' | tail -n7 | head -n1)
totalMUNDOdiferenca=$(($totalMUNDOatualexec - $totalMUNDOultimaexec))
totalMORTOSultimaexec=$(cat .estatistica | tr -d ',' | tail -n16 | head -n1)
totalMORTOSatualexec=$(cat .estatistica | tr -d ',' | tail -n6 | head -n1)
totalMORTOSdiferenca=$(($totalMORTOSatualexec - $totalMORTOSultimaexec))
totalBRASILultimaexec=$(cat .estatistica | tr -d ',' | tail -n15 | head -n1)
totalBRASILatualexec=$(cat .estatistica | tr -d ',' | tail -n5 | head -n1)
totalBRASILdiferenca=$(($totalBRASILatualexec - $totalBRASILultimaexec))
totalMORTESultimaexec=$(cat .estatistica | tr -d ',' | tail -n14 | head -n1)
totalMORTESatualexec=$(cat .estatistica | tr -d ',' | tail -n4 | head -n1)
totalMORTESdiferenca=$(($totalMORTESatualexec - $totalMORTESultimaexec))
totalRECUPERADOultimaexec=$(cat .estatistica | tr -d ',' | tail -n13 | head -n1)
totalRECUPERADOatualexec=$(cat .estatistica | tr -d ',' | tail -n3 | head -n1)
totalRECUPERADOdiferenca=$(($totalRECUPERADOatualexec - $totalRECUPERADOultimaexec))
casosSUAVESultimaexec=$(cat .estatistica | tr -d ',' | tail -n12 | head -n1)
casosSUAVESatualexec=$(cat .estatistica | tr -d ',' | tail -n2 | head -n1)
casosSUAVESdiferenca=$(($casosSUAVESatualexec - $casosSUAVESultimaexec))
casosCRITICOSultimaexec=$(cat .estatistica | tr -d ',' | tail -n11 | head -n1)
casosCRITICOSatualexec=$(cat .estatistica | tr -d ',' | tail -n1 | head -n1)
casosCRITICOSdiferenca=$(($casosCRITICOSatualexec - $casosCRITICOSultimaexec))
echo "ESTATISTICA - AUMENTO DO COVID-19 DESDE A ULTIMA EXECUÇÃO DO SCRIPT"
echo
echo "DATA DA ULTIMA EXECUÇÃO: $DATAultimaexec"
echo "DATA DA EXECUÇÃO ATUAL: $DATAatualexec"
echo
echo -e "\033[01;33m$totalMUNDOdiferenca\033[01;00m CONTAMINADOS no MUNDO INTEIRO desde a Última Execução."
echo -e "\033[01;31m$totalMORTOSdiferenca\033[01;00m MORTES no MUNDO INTEIRO desde a Última Execução."
echo
echo -e "\033[01;33m$totalBRASILdiferenca\033[01;00m CONTAMINADOS no $pais desde a Última Execução."
echo -e "\033[01;31m$totalMORTESdiferenca\033[01;00m MORTOS no $pais desde a Última Execução."
echo -e "\033[01;32m$totalRECUPERADOdiferenca\033[01;00m RECUPERADOS no $pais desde a Última Execução."
echo -e "\033[01;36m$casosSUAVESdiferenca\033[01;00m CASOS SUAVES no $pais desde a Última Execução."
echo -e "\033[01;31m$casosCRITICOSdiferenca\033[01;00m CASOS CRÍTICOS no $pais desde a Última Execução."
echo
exit
