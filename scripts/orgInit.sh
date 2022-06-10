bold=$(tput bold)
normal=$(tput sgr0)

echo ${bold}Create Scratch Org$1${normal}
echo sfdx force:org:create -f config/project-scratch-def.json --setalias $1 --setdefaultusername --durationdays $2 --targetdevhubusername SourceOrgHLSIDO --wait 60
sfdx force:org:create -f config/project-scratch-def.json --setalias $1 --setdefaultusername --durationdays $2 --targetdevhubusername SourceOrgHLSIDO --wait 60 
sleep 5
echo -e

echo ${bold}Install Health Cloud${normal}
echo sfdx force:package:install --package "04t4W000002g1ObQAI" --wait 10 --publishwait 10
sfdx force:package:install --package "04t4W000002g1ObQAI" --wait 10 --publishwait 10
echo -e

echo ${bold}Push Source${normal}
echo sfdx force:source:push --forceoverwrite --loglevel fatal --wait 30
sfdx force:source:push --forceoverwrite --loglevel fatal --wait 30
echo -e

echo ${bold}Create HC User${normal}
echo sfdx force:user:create -a pattyPatientCoordination -f users/hc_patientcoordination.json
sfdx force:user:create -a pattyPatientCoordination -f users/hc_patientcoordination.json
echo -e

echo ${bold}Apply Permission Set${normal}
echo sfdx force:user:permset:assign -n HCDemo_Patient_Management_Coordination
sfdx force:user:permset:assign -n HCDemo_Patient_Management_Coordination
echo -e

echo ${bold}Setup Password Admin${normal}
echo sfdx shane:user:password:set -g User -l User -p iLoveHealthCloudSince2015
sfdx shane:user:password:set -g User -l User -p iLoveHealthCloudSince2015
echo -e

echo ${bold}Setup Password Patient Coordinator${normal}
echo sfdx shane:user:password:set -g Patty -l Patient Coordinator -p iLoveHealthCloudSince2015
sfdx shane:user:password:set -g Patty -l Patient Coordinator -p iLoveHealthCloudSince2015
echo -e

echo ${bold}Open Scratch Org: $1${normal}
echo sfdx force:org:open
sfdx force:org:open
