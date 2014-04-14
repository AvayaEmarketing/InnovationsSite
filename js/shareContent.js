 $(document).ready(function () {
        $('.friend').click(function () {
            $('#shareContent').modal('show');
        });

        $('#Accept').click(function () {
            var mails = $("#mails").val();
            var mail_from = $("#mail_from").val();
            var mensaje = $("#mensaje").val();
			var lang = QueryString.lang;
            enviar_correo(mail_from, mails, mensaje, lang.toLowerCase());
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
                if (resultado.d !== "fail") {
                    window.top.location.href = "http://www4.avaya.com/cala/comms/inv-repo/english.html?lang=ESP";
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