const App = require('./index');
const fs = require('fs');


async function app () {
  try {
    const data = await new Promise((resolve, reject) => {
      fs.readFile(process.env.EVENT_PATH, 'utf8', (err, data) => {
        if (err) {
          reject(err);
        } else {
          resolve(data);
        }
      });
    });
    const response = await App.handler(data);
    return response;
  } catch (e) {
    throw e;
  }
}

app()
.then(ok => {
  let message = ok ? ok : 'process is done';
  console.log(message)
})
.catch(e => {
  console.log(e);
})
.finally(()=> {
  console.log('process ended');
})