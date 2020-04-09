#!/bin/bash
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
rm execute.sh
chmod +x next.sh
mv next.sh execute.sh
./execute.sh
exit
