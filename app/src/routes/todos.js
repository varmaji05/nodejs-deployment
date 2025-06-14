const express = require('express');
const router = express.Router();

const todos = [
  { id: 1, task: "Learn Docker", completed: false },
  { id: 2, task: "Write Terraform", completed: false }
];

router.get('/', (req, res) => {
  res.json(todos);
});

router.post('/', (req, res) => {
  const newTodo = req.body;
  todos.push(newTodo);
  res.status(201).json(newTodo);
});

module.exports = router;
