# Redis on Okteto Cloud - Kubernetes for Developer


## Pre-requisite

- Create Okteto Cloud Acccount - (https://okteto.com/) login via Github Credentials

- Install okteto CLI for Mac/Linux User :- 
```
curl https://get.okteto.com -sSfL | sh
```
- Windows:

Download (https://downloads.okteto.com/cli/okteto.exe) and add it to your $PATH.

## connect with okteto Cli and okteto namespaces 
```
sangam:~ sangam$ okteto login
Authentication will continue in your default browser
You can also open a browser and navigate to the following address:
---- you will get link for re-direct via web browser 
 ✓  Logged in as sangam14
    Run `okteto namespace` to switch your context and download your Kubernetes credentials.
sangam:~ sangam$ okteto namespace
 ✓  Updated context 'cloud_okteto_com' in '/Users/sangam/.kube/config'
sangam:~ sangam$ 
```
Now your developer environment connected with CLI 

## Visit to UI okteto Cloud Dashboard  :- (https://cloud.okteto.com/)



