const todoService = require('../services/todoService');

const getTodos = (req, res) => {
  const todos = todoService.getTodos();
  res.json(todos);
};

const createTodo = (req, res) => {
  const newTodo = req.body;
  const added = todoService.addTodo(newTodo);
  res.status(201).json(added);
};

module.exports = { getTodos, createTodo };
