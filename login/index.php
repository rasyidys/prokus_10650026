<?php 
error_reporting(0);
session_start();
if($_SESSION['user'] OR $_SESSION['pass']){
	header('location:../dashboard/?v=home');
	exit;
}
?>

<html>
<head>
<title>Login</title>
</head>
<body>
<form action="login.proses.php?mod=login" method="POST">
<table align="center">
<tr>
<td>Username</td><td>: <input type="text" value="" name="username" /></td>
</tr>
<tr>
<td>Password</td><td>: <input type="password" value="" name="pass" /></td>
</tr>
<tr>
<td colspan="2" align="right"><input type="submit" value="Login" name="login" /></td>
</tr>
</table>
</form>
</body>
</html>

