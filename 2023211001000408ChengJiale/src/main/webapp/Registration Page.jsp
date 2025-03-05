<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2025/3/5
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Page</title>
    <script>
        $(document).ready(function () {
            // Attach a submit event handler to the form
            $('#registrationForm').submit(function (event) {
                // Prevent the default form submission behavior
                event.preventDefault();

                // Get form field values
                var username = $('#username').val();
                var password = $('#password').val();
                var email = $('#email').val();
                var birthdate = $('#birthdate').val();

                // Reset previous error messages
                $('.error').text('');

                var isValid = true;

                // Validate username
                if (username === '') {
                    $('#usernameError').text('Username is required');
                    isValid = false;
                }

                // Validate password
                if (password === '') {
                    $('#passwordError').text('Password is required');
                    isValid = false;
                } else if (password.length < 8) {
                    $('#passwordError').text('Password must be at least 8 characters long');
                    isValid = false;
                }

                // Validate email
                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (email === '') {
                    $('#emailError').text('Email is required');
                    isValid = false;
                } else if (!emailRegex.test(email)) {
                    $('#emailError').text('Please enter a valid email address');
                    isValid = false;
                }

                // Validate birthdate
                var birthdateRegex = /^\d{4}-\d{2}-\d{2}$/;
                if (birthdate === '') {
                    $('#birthdateError').text('Birthdate is required');
                    isValid = false;
                } else if (!birthdateRegex.test(birthdate)) {
                    $('#birthdateError').text('Please enter a valid birthdate in yyyy - mm - dd format');
                    isValid = false;
                }

                // If all validations pass, submit the form
                if (isValid) {
                    this.submit();
                }
            });
        });
    </script>
</head>
<body>
<h2>User Registration</h2>
<form id="registrationForm" action="#" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username"><br>
    <span class="error" id="usernameError"></span><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password"><br>
    <span class="error" id="passwordError"></span><br>

    <label for="email">Email:</label>
    <input type="text" id="email" name="email"><br>
    <span class="error" id="emailError"></span><br>

    <label for="birthdate">Birthdate (yyyy - mm - dd):</label>
    <input type="text" id="birthdate" name="birthdate"><br>
    <span class="error" id="birthdateError"></span><br>

    <label>Gender:</label>
    <input type="radio" id="male" name="gender" value="male">
    <label for="male">Male</label>
    <input type="radio" id="female" name="gender" value="female">
    <label for="female">Female</label><br>

    <input type="submit" value="Register">
</form>
</body>
</html>
