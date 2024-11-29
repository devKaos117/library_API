/*
*           Imports
*/
//      aplication modules
const express = require('express');
//      aplication routes
const routes = require('./routes/router');
/*
*           Init Settings
*/
//      express
const app = express();
app.use(express.json());
/*
*           Server Hosting
*/
//      settings
const PORT = 3000;
app.use('/', routes);
//      hosting
app.listen(PORT, () => {
    console.log(PORT);
});