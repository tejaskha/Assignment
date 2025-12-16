document.getElementById("loginForm").addEventListener("submit", function (e) {
    e.preventDefault();


    const email = document.getElementById("loginEmail").value.trim();
    const password = document.getElementById("loginPassword").value.trim();


    const emailError = document.getElementById("loginEmailError");
    const passwordError = document.getElementById("loginPasswordError");


    emailError.textContent = "";
    passwordError.textContent = "";


    let isValid = true;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;


    if (email === "") {
        emailError.textContent = "Email is required";
        isValid = false;
    } else if (!emailPattern.test(email)) {
        emailError.textContent = "Invalid email format";
        isValid = false;
    }


    if (password === "") {
        passwordError.textContent = "Password is required";
        isValid = false;
    } else if (password.length < 6) {
        passwordError.textContent = "Password must be at least 6 characters";
        isValid = false;
    }


    if (isValid) {
        alert("Login Successful");
        document.getElementById("loginForm").reset();
    }
});