const todos = [
  { id: 1, task: "Learn Docker", completed: false },
  { id: 2, task: "Write Terraform", completed: false }
];

const getTodos = () => {
  return todos;
};

const addTodo = (todo) => {
  todos.push(todo);
  return todo;
};

module.exports = { getTodos, addTodo };
