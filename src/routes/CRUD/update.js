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
    res.status(200).json(utils.returnData(req, null));
});
/*
*           Exporting routes
*/
module.exports = router;