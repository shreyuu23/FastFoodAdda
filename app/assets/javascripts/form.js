$(document).ready(function() {

  $( "#form_id" ).submit(function( event ) {
    if ( $("#name").val() == "" || $("#mobile").val() == "" || $("#email").val() == ""||$("#address").val() == ""){
      alert("All fields mandatory")
      event.preventDefault();
    }
    else {
      return [  cmobile(),cemail(), caddress()];
    }
});
});

      

      function cmobile(e){
        debugger
        if(parseInt($("#mobile").val().length) != 10 ){
              alert("enter valid mobile number");
              event.preventDefault();
            }
            else
            {
              return;
            }
        }

     




      function cemail(e){

            var sEmail = $('#email').val();
            // Checking Empty Fields
            if ($.trim(sEmail).length == 0) {
            alert('enter email id');
            event.preventDefault();
            }

            
            if (validateEmail(sEmail)) {
            alert('Nice!! your Email is valid, now you can continue..');
            }

            else {
            alert('Invalid Email Address');
            event.preventDefault();
            }

      }

            // Function that validates email address through a regular expression.
      function validateEmail(sEmail) {
            var filter = /^[w-.+]+@[a-zA-Z0-9.-]+.[a-zA-z0-9]{2,4}$/;

        
            if (filter.test(sEmail)) {
            return true;
            }
            else {
            return false;
            }
      }