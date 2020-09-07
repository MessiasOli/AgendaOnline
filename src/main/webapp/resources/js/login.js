
$(document).ready(function(){
        $('.login-info-box').fadeOut();
        $('.login-show').addClass('show-log-panel');
    
    $('.login-reg-panel input[type="radio"]').on('change', function() {
        if($('#log-login-show').is(':checked')) {
            $('.register-info-box').fadeOut(); 
            $('.login-info-box').fadeIn();
            
            $('.white-panel').addClass('right-log');
            $('.register-show').addClass('show-log-panel');
            $('.login-show').removeClass('show-log-panel');
            
        }
        else if($('#log-reg-show').is(':checked')) {
            $('.register-info-box').fadeIn();
            $('.login-info-box').fadeOut();
            
            $('.white-panel').removeClass('right-log');
            
            $('.login-show').addClass('show-log-panel');
            $('.register-show').removeClass('show-log-panel');
        }
    });

    $(".login").click(function(){		
        console.log("Submetido");
        $("form").first().submit();
    });

});

$(function(){
    $("#saveUser").click(function(){
		if ($("#name").val() != "" && $("#email").val() != "" && $("#senha").val() != "" &&
			$("#password").val() != "")
		{
			if($("#password").val() == $("#confirmPassWord").val()){
        		console.log("Submetido");
        		$("#registerForm").first().submit();
				alert("Usuário cadastrado com suscesso!");
			}else{
                alert("Campos de senha não conferem");
            }
				
		}else{
			alert("Preencha todos os campos"); 
		}
    });
});

$(function(){
    $("#phone").mask("(99) 9 9999-9999",{placeholder:"(xx) x xxxx-xxxx"});
});