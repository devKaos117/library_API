/*
*           Imports
*/
//      express router
const router = require('express').Router();
/*
*           Routes
*/
//      Database CRUD routers
const CRUD_c = require('./CRUD/create');
const CRUD_r = require('./CRUD/read');
const CRUD_u = require('./CRUD/update');
const CRUD_d = require('./CRUD/delete');
//      Database CRUD routes
router.use('/create', CRUD_c);
router.use('/read', CRUD_r);
router.use('/update', CRUD_u);
router.use('/delete', CRUD_d);
/*
*           Exporting routes
*/
module.exports = router;