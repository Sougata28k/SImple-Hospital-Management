function validateForm() {
    var x = document.forms["myForm"]["name"].value;
    var y = document.forms["myForm"]["age"].value;
    var z = document.forms["myForm"]["contact"].value;
    if (x == "") {
      alert("Name must be filled out");
      return false;
    }
    else if (y == "") {
      alert("Age must be filled out");
      return false;
    }
   else if (z == "") {
      alert("Contact must be filled out");
      return false;
    }
    else if(x=="" && y==""){
	alert("Name and Age must be filled out");
      return false;
}
 else if(x=="" && z==""){
	alert("Name and Contact must be filled out");
      return false;
}
 else if(y=="" && z==""){
	alert("Age and Contact must be filled out");
      return false;
}
 else if(y=="" && z=="" && x== ""){
	alert("All the required information must be filled out");
      return false;
}
 
    
  }