var oTable;
var giRedraw = false;
var dataTab;
var aData;
var iframe;

//tipo de mensajes ->  default, info, primary, sucess, warning, danger
function message(texto, titulo, tipo) {
    BootstrapDialog.show({
        //type: 'BootstrapDialog.TYPE_' + tipo,
        title: titulo,
        message: texto,
        cssClass: 'type-' + tipo
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

function validaMail(mail) {
    var rta;
    var correo = /^[A-Za-z][A-Za-z0-9_\.-]*@[A-Za-z0-9_-]+\.[A-Za-z0-9_.]+[A-za-z]$/;
    if (!correo.exec(mail)) {
        rta = false;
    } else {
        rta = true;
    }
    return rta;
}

$(document).ready(function () {
   

    $('#Register').click(function () {
        var formulario = getForm();
        if ((formulario.overall === "") || (formulario.overall === undefined)) {
            message("Please select one item", "Register", "danger");
        } else {
            if (formulario.email !== "") {
                if (validaMail(formulario.email)) {
                    registrarInfo(formulario);
                } else {
                    message("Please check the email format", "Register", "danger");
                }
            } else {
                registrarInfo(formulario);
            }
        }
        return false;
    });

});


function registrarInfo(formulario) {
    var lang = QueryString.lang;
    var datae = { 'overall': formulario.overall, 'email': formulario.email, 'comments': formulario.comments, 'language':lang };
    $.ajax({
        type: "POST",
        url: "feedback.aspx/putData",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(datae),
        dataType: "json",
        success: function (resultado) {
            if (resultado.d === "ok") {
                //document.location.href = "thanks.html";
                var idioma = QueryString.lang;
                var titulo = "";
                var mensaje = "";
                var label = ""
                if (idioma == "ESP") {
                    titulo = "Atención";
                    mensaje = "Gracias por su feedback";
                    Etq = "Aceptar";
                }
                else if (idioma == "ENG") {
                    titulo = "Attention";
                    mensaje = "Thanks for your feedback";
                    Etq = "Accept";
                }
                else if (idioma == "POR") {
                    titulo = "Atenção";
                    mensaje = "Obrigado pelo seu feedback";
                    Etq = "Accept";
                }
                BootstrapDialog.show({
                    cssClass: 'type-danger',
                    title: titulo,
                    message: mensaje,
                    buttons: [{
                        label: Etq,
                        cssClass: 'btn-danger',
                        action: function () {
                            if (idioma == "ESP") {
                                document.location.href = "spanish.html";
                            } else if (idioma == "ENG") {
                                document.location.href = "english.html";
                            } else if (idioma == "POR") {
                                document.location.href = "portuguese.html";
                            }
                        }
                    }]

                });
            } else {
                message("Alert, please try again", "Register", "danger");
            }
        }
    });
    return false;
}


function getForm() {
    var overall = $("#formulario input[type='radio']:checked").val();
    var comments = $("#comments");
    var email = $("#email");
    
    var formulario = new Object();
    formulario.overall = overall;
    formulario.email = email.val();
    formulario.comments = comments.val();
    
    return formulario;
}


