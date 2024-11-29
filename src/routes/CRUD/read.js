/*
*           Imports
*/
//      express router
const router = require('express').Router();
//      database connection
const db = require('./../../database/connect');
//      internal aplication components
const utils = require('../../utils');
/*
*           Routes
*/
router.post('/', (req,res) => {
    db.pool.query("DESCRIBE Livros;").then((rows) => {
        res.status(200).json(utils.returnData(req, rows));
    });
    db.pool.end();
});
/*
*           Exporting routes
*/
module.exports = router;