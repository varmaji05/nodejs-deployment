const express = require('express');
const dotenv = require('dotenv');
const app = express();

dotenv.config();
app.use(express.json());

const healthRouter = require('./routes/health');
const todoRouter = require('./routes/todos');

app.use('/health', healthRouter);
app.use('/api/v1/todos', todoRouter);

module.exports = app;
