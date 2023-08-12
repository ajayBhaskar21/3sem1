// Username starts with a capital letter and must contain at least one digit
function validateUsername() {
    let username = document.getElementById('username').value;
   
    let usernamePattern = /^[A-Z][A-Za-z0-9]*\d.*$/;

    if (usernamePattern.test(username)) {
        document.getElementById('error1').innerHTML = "";
        return true;
    } else {
        document.getElementById('error1').innerHTML = "*Username must start with a capital letter and contain at least one digit";
        return false;
    }
}

// Password contains at least 1 uppercase letter, 1 lowercase letter, and 1 special character (excluding . , ; :)
function validatePassword() {
    let password = document.getElementById('password').value;
    if (password.length == 0) {
        document.getElementById('error3').innerHTML = "";
    }
    let uppercaseFlag = false;
    let lowercaseFlag = false;
    let specialCharFlag = false;
    let excludedChars = ",.;:";
    let specialChars = "!@#$%^&*()-_=+{}[]|'\"<>";

    if (password.length < 8) {
        document.getElementById('error3').innerHTML = "*Password must be at least 8 characters long";
        return false;
    }

    for (let i = 0; i < password.length; i++) {
        if (password[i] >= 'A' && password[i] <= 'Z') {
            uppercaseFlag = true;
        } else if (password[i] >= 'a' && password[i] <= 'z') {
            lowercaseFlag = true;
        } else if (specialChars.indexOf(password[i]) !== -1) {
            specialCharFlag = true;
        } else if (excludedChars.indexOf(password[i]) !== -1) {
            document.getElementById('error3').innerHTML = "*Password must not contain , . ; :";
            return false;
        }
    }

    if (uppercaseFlag && lowercaseFlag && specialCharFlag) {
        document.getElementById('error3').innerHTML = "";
        return true;
    } else {
        document.getElementById('error3').innerHTML = "*Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character";
        return false;
    }
}



// Email contains @, ., 1-20 characters
function validateEmail() {
    let email = document.getElementById('email').value;
    let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{1,20}$/;

    if (emailPattern.test(email)) {
        document.getElementById('error5').innerHTML = "";
        return true;
    } else {
        document.getElementById('error5').innerHTML = "*Invalid email format";
        return false;
    }

   


}

function submitForm() {
    if (validateUsername() && validatePassword() && validateEmail()) {
        // Form validation successful, you can submit the form or perform other actions here
        alert("Form validation successful");
    } else {
        // Form validation failed, display error message or take appropriate action
        alert("Form validation failed");
    }
}
