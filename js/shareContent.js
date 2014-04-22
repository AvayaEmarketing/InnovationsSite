 $(document).ready(function () {
        $('.friend').click(function () {
            $('#shareContent').modal('show');
        });

         $('#Accept').click(function () {
            var mails = $("#mails").val();
            var mail_from = $("#mail_from").val();
            var mensaje = $("#mensaje").val();
			var validado = validateMultipleEmailsCommaSeparated(mails);
			if(validado){
				var lang = QueryString.lang;
				enviar_correo(mail_from, mails, mensaje, lang.toLowerCase());
				guardarInfo(mail_from,mails,mensaje);
				return true;
			}else{
				document.getElementById("incorrect").innerHTML = "Invalid format email(s)";
				$( "#incorrect" ).addClass( "alert alert-danger" );
				return false;
			}
        }); 
    });

    function enviar_correo(de, para, mensaje,lang) {

        var datae = {'mail_from': de, 'correo': para, 'mensaje':mensaje,'idioma':lang};
        $.ajax({
            type: "POST",
            url: "EnviarMail.aspx/sendMails",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(datae),
            dataType: "json",
            success: function (result) {
                if (result.d !== "fail") {
                    document.location.href = "http://www4.avaya.com/cala/comms/inv-repo/index.html";
					return true;
                } else {
                    alert("Alert, please try again");
                }
            }
        });
        return false;
    }
	
	function guardarInfo(name, mailto, comments) {

        var datae = {'name': name, 'mailto': mailto, 'comments':comments};
        $.ajax({
            type: "POST",
            url: "EnviarMail.aspx/putData",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(datae),
            dataType: "json",
            success: function (result) {
                if (result.d !== "fail") {
                    document.location.href = "http://www4.avaya.com/cala/comms/inv-repo/index.html";
					return true;
                } else {
                    alert("Alert, please try again");
                }
            }
        });
        return false;
    }
	
	var QueryString = function () {
    // This function is anonymous, is executed immediately and 
    // the return value is assigned to QueryString!
    var query_string = {};
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        // If first entry with this name
        if (typeof query_string[pair[0]] === "undefined") {
            query_string[pair[0]] = pair[1];
            // If second entry with this name
        } else if (typeof query_string[pair[0]] === "string") {
            var arr = [query_string[pair[0]], pair[1]];
            query_string[pair[0]] = arr;
            // If third or later entry with this name
        } else {
            query_string[pair[0]].push(pair[1]);
        }
    }
    return query_string;
}();

function trim(str, chars) {
    return ltrim(rtrim(str, chars), chars);
}
function ltrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}
function rtrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

function validateEmail(field) {
    var regex=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    return (regex.test(trim(field))) ? true : false;
}
function validateMultipleEmailsCommaSeparated(value) {
    var result = value.split(",");

    //alert(result);
    for(var i = 0;i < result.length;i++)
    if(!validateEmail(result[i])) 
            return false;               
    return true;
}