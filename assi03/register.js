document.getElementById("registerForm").addEventListener("submit", function (e) {
    e.preventDefault();


    const name = document.getElementById("regName").value.trim();
    const email = document.getElementById("regEmail").value.trim();
    const phone = document.getElementById("regPhone").value.trim();
    const password = document.getElementById("regPassword").value.trim();


    document.getElementById("nameError").textContent = "";
    document.getElementById("emailError").textContent = "";
    document.getElementById("phoneError").textContent = "";
    document.getElementById("passwordError").textContent = "";


    let isValid = true;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const phonePattern = /^[0-9]{10}$/;


    if (name === "") {
        document.getElementById("nameError").textContent = "Name is required";
        isValid = false;
    }


    if (email === "") {
        document.getElementById("emailError").textContent = "Email is required";
        isValid = false;
    } else if (!emailPattern.test(email)) {
        document.getElementById("emailError").textContent = "Invalid email format";
        isValid = false;
    }


    if (!phonePattern.test(phone)) {
        document.getElementById("phoneError").textContent = "Phone number must be 10 digits";
        isValid = false;
    }


    if (password === "") {
        document.getElementById("passwordError").textContent = "Password is required";
        isValid = false;
    } else if (password.length < 6) {
        document.getElementById("passwordError").textContent = "Password must be at least 6 characters";
        isValid = false;
    }


    if (isValid) {
        alert("Registration Successful");
        document.getElementById("registerForm").reset();
    }
});