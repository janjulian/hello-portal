# Salesforce App

## Dev, Build and Test

Create scratch org.
```
sfdx force:org:create -f config/project-scratch-def.json -a hello-portal -s
```

Push source code.
```
sfdx force:source:push
```

Give access to app.
```
sfdx force:user:permset:assign -n Portal_Admin
```

Set role to current user
```
sfdx force:apex:execute -f dev/set-user-role.apex 
```

Generate import plan.
```
sfdx force:data:tree:export -p -q dev/data/plan/plan.soql -d dev/data/plan
```

Import plan.
```
 sfdx force:data:tree:import -p dev/data/plan/Account-Partner-Contact-plan.json
 ```

Create portal users.
```
sfdx force:apex:execute -f dev/data/create-partner-users.apex 
```


Run all
```
sfdx force:org:create -f config/project-scratch-def.json -a hello-portal -s &&
sfdx force:source:push &&
sfdx force:user:permset:assign -n Portal_Admin &&
sfdx force:apex:execute -f dev/set-user-role.apex &&
 sfdx force:data:tree:import -p dev/data/plan/Account-Partner-Contact-plan.json &&
sfdx force:apex:execute -f dev/data/create-partner-users.apex 
```