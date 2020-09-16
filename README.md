NOTE: WIP
# Welcome to lambda local
this project is for nodejs lambda, aws.
## For local development
create an index.js file like this:
``` 
module.exports.handler = async (event) => {
  .... # function content here
}
``` 
then run next command
```
EVENT_PATH=<event_path> node proxy.js
```
**EVENT_PATH** is the path of the json data file