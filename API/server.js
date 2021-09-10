const express = require('express');
const dotenv = require('dotenv');
const xss = require('xss-clean');
const helmet = require('helmet');
const mongoSanitize = require('express-mongo-sanitize');
const bodyParser = require('body-parser')

const connectDB = require('./config/dbconn');
const authRouter = require('./router/auth');
const officerRouter = require('./router/officer');
const penaltyRouter = require('./router/penalty');
const helpRouter = require('./router/help');

dotenv.config({ path: './config/config.env' });
const app = express();
app.use(xss())
app.use(helmet())
app.use(mongoSanitize())
app.use(bodyParser.json());


// connect to DB
connectDB();


// handle CORS
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    next();
});

app.use('/api/auth', authRouter);
app.use('/api/officer', officerRouter);
app.use('/api/penalty', penaltyRouter);
app.use('/api/help', helpRouter);


// handle 404
app.use((req, res, next) => {
    res.status(404).json({
        status: false,
        msg: '404! Nothing Found!'
    })
})

app.listen(process.env.SERVER_PORT || 8080);

console.log("API running on port: " + process.env.SERVER_PORT || 8080);