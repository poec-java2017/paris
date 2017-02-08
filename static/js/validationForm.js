/**
 * Created by formation2 on 08/02/17.
 */
function validate()
{


    if( document.registrationForm.Password.value != document.registrationForm.PasswordConfirm.value )
    {
        alert( "Please provide two identical passwords !" );
        document.registrationForm.Password.focus() ;
        return false;
    }

}
$(document).on('submit', 'registrationForm', function(e){
    e.preventDefault();
   if ()
});