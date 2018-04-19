function checkPassword()
{
	var password = document.getElementById('pass');
	var repassword = document.getElementById('repassword');
	var message = document.getElementById('confirmMessage');
	var goodColor = "#66cc66";
	var badColor = "#ff6666";
	if(password.value === repassword.value){
		repassword.style.backgroundColor = goodColor;
		message.style.color = goodColor;
		message.innerHTML = "Passwords Match!"
	}else{
		repassword.style.backgroundColor = badColor;
		message.style.color = badColor;
		message.innerHTML = "Passwords Do Not Match!"
	}
};  