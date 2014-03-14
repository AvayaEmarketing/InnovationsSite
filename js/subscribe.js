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

function validar(obj) {
    var respuesta = 0;
    for (var i in obj) {
        if (obj[i] == null || obj[i].length < 1 || /^\s+$/.test(obj[i])) {
            respuesta = respuesta + 1;
            $("#" + i).css('background', '#E2E4FF');
        } else {
            if (i === "email") {
                var correo = /^[A-Za-z][A-Za-z0-9_\.-]*@[A-Za-z0-9_-]+\.[A-Za-z0-9_.]+[A-za-z]$/;
                if (!correo.exec(obj[i])) {
                    respuesta = respuesta + 1;
                    $("#" + i).css('background', '#E0AAAA');
                } else {
                    respuesta = respuesta + 0;
                    $("#" + i).css('background', '#FFF');
                }
            } else {
                respuesta = respuesta + 0;
                $("#" + i).css('background', '#FFF');
            }
            
        }
    }
    if (respuesta === 0) {
        return true;
    } else {
        return false;
    }
}

$(document).ready(function () {
    cargarPaises();

    $('#Register').click(function () {
        var formulario = getForm();
        var validado = validar(formulario);
        if (validado) {
            registrarInfo(formulario);
        } else {
            message("Please check the Mandatory fields or Email format", "Register", "danger");
        }
        return false;
    });

});


function registrarInfo(formulario) {
    var lang = QueryString.lang;
    var datae = { 'firstname': formulario.firstname, 'lastname': formulario.lastname, 'email': formulario.email, 'company': formulario.company, 'country': formulario.country, 'business': formulario.business, 'language':lang };
    $.ajax({
        type: "POST",
        url: "subscribe.aspx/putData",
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
                    mensaje = "Se ha suscrito correctamente a Innovations Avaya";
                    Etq = "Aceptar";
                }
                else if (idioma == "ENG") {
                    titulo = "Attention";
                    mensaje = "Thanks for subscribe to Avaya Innovations Magazine";
                    Etq = "Accept";
                }
                else if (idioma == "POR") {
                    titulo = "Attention";
                    mensaje = "Thanks for to Avaya Innovations Magazine";
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
    var firstname = $("#firstname");
    var lastname = $("#lastname");
    var email = $("#email");
    var company = $("#company");
    var country = $("#country");
    var business = $("#business");

    var formulario = new Object();
    formulario.firstname = firstname.val();
    formulario.lastname = lastname.val();
    formulario.email = email.val();
    formulario.company = company.val();
    formulario.country = country.val();
    formulario.business = business.val();
    
    return formulario;
}


function cargarPaises() {
    $("#country").html("");
    $.ajax({
        type: "POST",
        url: "subscribe.aspx/getCountries",
        contentType: "application/json; charset=utf-8",
        data: '{ }',
        dataType: "json",
        success: AjaxGetCountryDataSucceeded,
        error: AjaxGetCountryDataFailed
    });
}

function AjaxGetCountryDataSucceeded(result) {
    if (result.d != "No data Found") {
        var jposts = result.d;
        var item = $.parseJSON(jposts);
        var error = "";
        //recorremos todas las filas del resultado del proceso que obtenemos en Json
        $.each(item, function (i, valor) {
            //introducimos los option del Json obtenido

            $("#country").append('<option value="' + valor.Country + '">' + valor.Country + '</option>');

        });
    }
}

function AjaxGetCountryDataFailed(result) {
    alert(result.status + ' ' + result.statusText);
}