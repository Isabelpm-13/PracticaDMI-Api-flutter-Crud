
        const mysql = require('mysql');

        const mysqlConnection =  mysql.createPool({
            host: 'sql4.freemysqlhosting.net',
            port: '3306',
            user: 'sql4448829',
            password: 'VdbY7szskz',
            database: 'sql4448829'
        });
    
        
        
        
        module.exports  = mysqlConnection;