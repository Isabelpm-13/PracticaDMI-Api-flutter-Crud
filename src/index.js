const express = require('express');

const app = express();

//Configuración
app.set('port', process.env.PORT || 3000);

//Middlewares
app.use(express.json());

//Rutas
app.use(require('./routes/empleados'));


//Arrancar el servidor
app.listen(app.get('port'), () =>{
    console.log('Server on port 3000');
});

