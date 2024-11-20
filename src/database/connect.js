import mariadb from 'mariadb';
const pool = mariadb.createPool({
     host: '', 
     user:'', 
     password: '',
     connectionLimit: 5
});
pool.getConnection().then(conn => {
    conn.query("SELECT 1 as val").then((rows) => {
        console.log(rows); //[ {val: 1}, meta: ... ]
        //Table must have been created before 
        // " CREATE TABLE myTable (id int, val varchar(255)) "
        return conn.query("INSERT INTO myTable value (?, ?)", [1, "mariadb"]);
    }).then((res) => {
        console.log(res); // { affectedRows: 1, insertId: 1, warningStatus: 0 }
        conn.end();
        pool.end();
    }).catch(err => {
        //handle error
        console.log(err); 
        conn.end();
        pool.end();
    })
}).catch(err => {
    //not connected
    pool.end();
});