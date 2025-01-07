<!DOCTYPE html>
<html>
<head>
  <title>Login Form</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="login-container">
    <form id="login-form">
      <h2>Login</h2>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username"><br><br>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password"><br><br>
      <button id="submit-btn">Login</button>
    </form>
  </div>

  <script src="script.js"></script>
</body>
</html>


CSS (style.css)

body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
}

.login-container {
  width: 300px;
  margin: 50px auto;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

label {
  display: block;
  margin-bottom: 10px;
}

input[type="text"], input[type="password"] {
  width: 100%;
  height: 40px;
  margin-bottom: 20px;
  padding: 10px;
  border: 1px solid #ccc;
}

button {
  width: 100%;
  height: 40px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #3e8e41;
}


JavaScript (script.js)

document.getElementById('submit-btn').addEventListener('click', function(event) {
  event.preventDefault();
  const username = document.getElementById('username').value;
  const password = document.getElementById('password').value;

  // Validasi form
  if (username === '' || password === '') {
    alert('Isi semua field!');
    return;
  }

  // Kirim data ke server (contoh menggunakan fetch API)
  fetch('/login', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ username, password })
  })
  .then(response => response.json())
  .then(data => {
    if (data.success) {
      alert('Login berhasil!');
    } else {
      alert('Login gagal!');
    }
  })
  .catch(error => console.error(error));
});
