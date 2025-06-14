const express = require('express');
const dotenv = require('dotenv');
const app = express();

dotenv.config();
app.use(express.json());

const healthRoutes = require('../routes/health');
const todosRoutes = require('../routes/todos');

app.use('/health', healthRoutes);
app.use('/api/v1/todos', todosRoutes);

module.exports = app;
