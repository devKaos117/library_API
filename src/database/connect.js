/*
*           Imports
*/
//      database connector
import mariadb from 'mariadb';
/*
*           Init Settings
*/
const pool = mariadb.createPool({
     host: 'localhost', 
     user:'librarian', 
     password: 'babel',
     database: 'library',
     idleTimeout: 500,
     connectionLimit: 5
});
/*
*           Connection
*/
pool.getConnection().catch((err) => {
    console.log(err);
    pool.end();
});
/*
*           Exporting Connection
*/
export {pool};