const app = require('./app');
const {dbConnection} = require('./database');


async function main() {

    await dbConnection();

    await app.listen(3000);

    console.log('Server on port 3000: Connected');

}

main();