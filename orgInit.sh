sfdx force:org:create -f config/project-scratch-def.json -s -d 30 -w 15
sfdx force:package:install --package "04t4W000002g1ObQAI" --wait 10 --publishwait 10
sfdx force:source:push --forceoverwrite --loglevel fatal --wait 30
sfdx force:user:create -a pattyPatientCoordination -f users/hc_patientcoordination.json
sfdx force:user:permset:assign -n HCDemo_Patient_Management_Coordination
sfdx shane:user:password:set -g User -l User -p iLoveHealthCloudSince2015
sfdx shane:user:password:set -g Patty -l Patient Coordinator -p iLoveHealthCloudSince2015
sfdx force:org:open
