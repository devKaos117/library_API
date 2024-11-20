
/*
*           Imports
*/
//      express router
const router = require('express').Router();
//      internal aplication components
const utils = require('../../utils');
/*
*           Routes
*/
router.post('/', (req,res) => {
    res.status(200).send(utils.returnData(req, null));
});
/*
*           Exporting routes
*/
module.exports = router;