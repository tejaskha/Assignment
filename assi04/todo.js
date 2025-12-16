const todoInput = document.getElementById("todoInput");
const addBtn = document.getElementById("addBtn");
const todoList = document.getElementById("todoList");

addBtn.addEventListener("click", addTodo);

function addTodo() {
    const text = todoInput.value.trim();

    if (text === "") {
        alert("Enter a todo");
        return;
    }

    // Create list item
    const li = document.createElement("li");
    li.className = "list-group-item d-flex justify-content-between";

    li.textContent = text;

    // Create delete button
    const deleteBtn = document.createElement("button");
    deleteBtn.textContent = "Delete";
    deleteBtn.className = "btn btn-danger btn-sm";

    deleteBtn.addEventListener("click", function () {
        li.remove();   // removes <li> from <ul>
    });

    li.appendChild(deleteBtn);
    todoList.appendChild(li);

    todoInput.value = "";
}
