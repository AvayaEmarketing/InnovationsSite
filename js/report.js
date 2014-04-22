var oTable;
var giRedraw = false;
var dataTab;

var iframe;
var Json_data;
var dataTab2;
var oTable2;

var dataTab3;
var oTable3;


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

//Cargar Datos de los Subscribe
function cargarDatos() {
    
    $.ajax({
        type: "POST",
        url: "report.aspx/getDatosReg",
        contentType: "application/json; charset=utf-8",
        data: "{ }",
        dataType: "json",
        success: AjaxGetFieldDataSucceeded,
        error: AjaxGetFieldDataFailed
    });
}

function cargarDatos2() {

    $.ajax({
        type: "POST",
        url: "report.aspx/getDatosReg",
        contentType: "application/json; charset=utf-8",
        data: "{ }",
        dataType: "json",
        success: AjaxRefreshDataSucceeded,
        error: AjaxRefreshDataFailed
    });
}



function AjaxRefreshDataSucceeded(result) {
    if (result.d != "[]") {
        var jposts = result.d;
        var mensaje;
        var titulo;
        dataTab = $.parseJSON(jposts);
        oTable.fnClearTable();
        oTable.fnAddData(dataTab);
    } else {
        oTable.fnClearTable();
        message("No data found", "Alert", "danger");
    }
}

function AjaxRefreshDataFailed(result) {
    alert(result.status + ' ' + result.statusText);
}

function AjaxGetFieldDataSucceeded(result) {
    if (result.d != "[]") {
        var jposts = result.d;
        var mensaje;
        var titulo;
        try {
            dataTab = $.parseJSON(jposts);
        } catch (exception) {
            dataTab = "error";
        }
        if (dataTab != "error") {
            $("#datatables").css("visibility", "visible");
            oTable = $('#datatables').dataTable({
                "bProcessing": true,
                "aaData": dataTab,
                "aoColumns": [{ "mDataProp": "id" }, { "mDataProp": "firstname" }, { "mDataProp": "lastname" }, { "mDataProp": "email" }, { "mDataProp": "company" }, { "mDataProp": "country" }, { "mDataProp": "business" }, { "mDataProp": "language" }, { "mDataProp": "registerDate" }],
                "sPaginationType": "bootstrap",
                "aaSorting": [[0, "asc"]],
                "bJQueryUI": true
            });
        };
       
    } else {
        message("No data found", "Information", "danger");
    }
    
}

$(function () {
    $('.datatable').each(function () {
        var datatable = $(this);
        // SEARCH - Add the placeholder for Search and Turn this into in-line formcontrol
        var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
        search_input.attr('placeholder', 'Search')
        search_input.addClass('form-control input-small')
        search_input.css('width', '250px')

        // SEARCH CLEAR - Use an Icon
        var clear_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] a');
        clear_input.html('<i class="icon-remove-circle icon-large"></i>')
        clear_input.css('margin-left', '5px')

        // LENGTH - Inline-Form control
        var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
        length_sel.addClass('form-control input-small')
        length_sel.css('width', '75px')

        // LENGTH - Info adjust location
        var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_info]');
        length_sel.css('margin-top', '18px')
    });
});

function AjaxGetFieldDataFailed(result) {
    alert(result.status + ' ' + result.statusText);
}

$.extend($.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
});

function validar(obj) {
    var respuesta = 0;
    for (var i in obj) {
        if (obj[i] == null || obj[i].length < 1 || /^\s+$/.test(obj[i])) {
            respuesta = respuesta + 1;
            $("#" + i).css('background', '#E2E4FF');
        } else {
            respuesta = respuesta + 0;
            $("#" + i).css('background', '#FFF');
        }
    }
    if (respuesta === 0) {
        return true;
    } else {
        return false;
    }
}

    
$(document).ready(function () {
    validaSession();

    cargarDatos();
    cargarDatosFeedback();
	cargarDatosShare();

    $("#toExcel").click(function () {
        exportarTabla("XLS","subscribe");
    });

    $("#toExcel2").click(function () {
        exportarTabla("XLS","feedback");
    });
	
	$("#toExcel3").click(function () {
        exportarTabla("XLS","feedback");
    });

    $("#subscribe").css({ "background-color": "#8e040a", "color": "#fff" });

    $("#subscribe").click(function () {
        $("#cont_feedback").css({ "display": "none" });
		$("#cont_share").css({ "display": "none" });
        $("#cont_subscribe").css({ "display": "block", "margin-right": "auto", "margin-left": "auto", "*zoom": "1", "position": "relative" });
        $("#subscribe").css({ "background-color": "#8e040a", "color": "#fff" });
        $("#feedback").css({ "background-color": "transparent", "color": "#a1aaaf" });
		$("#share").css({ "background-color": "transparent", "color": "#a1aaaf" });
    });

    $("#feedback").click(function () {
        $("#cont_subscribe").css({ "display": "none" });
		$("#cont_share").css({ "display": "none" });
        $("#cont_feedback").css({ "display": "block", "margin-right": "auto", "margin-left": "auto", "*zoom": "1", "position": "relative" });
        $("#feedback").css({ "background-color": "#8e040a", "color": "#fff" });
        $("#subscribe").css({ "background-color": "transparent", "color": "#a1aaaf" });
		$("#share").css({ "background-color": "transparent", "color": "#a1aaaf" });
    });
	
	 $("#share").click(function () {
        $("#cont_subscribe").css({ "display": "none" });
		$("#cont_feedback").css({ "display": "none" });
        $("#cont_share").css({ "display": "block", "margin-right": "auto", "margin-left": "auto", "*zoom": "1", "position": "relative" });
        $("#share").css({ "background-color": "#8e040a", "color": "#fff" });
        $("#feedback").css({ "background-color": "transparent", "color": "#a1aaaf" });
		$("#subscribe").css({ "background-color": "transparent", "color": "#a1aaaf" });
    });

    
    $("#exit").click(function () {
        cerrarSession();
    });
});

    function cerrarSession() {
        $.ajax({
            type: "POST",
            url: "report.aspx/cerrarSession",
            contentType: "application/json; charset=utf-8",
            data: "{}",
            dataType: "json",
            success: function (resultado) {
                document.location.href = "admin.aspx";
            }
        });
        return false;
    }

    function validaSession() {
        $.ajax({
            type: "POST",
            url: "report.aspx/validaSession",
            contentType: "application/json; charset=utf-8",
            data: "{}",
            dataType: "json",
            success: function (resultado) {
                if (resultado.d === "fail") {
                    document.location.href = "admin.aspx";
                }
            }
        });
        return false;
    }



   
    //Descargar el Excel del listado de traducciones
    function exportarTabla(formato, tipo) {
        var datae = { 'tipo': tipo };
        $.ajax({
            type: "POST",
            url: "report.aspx/Convertir",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(datae),
            dataType: "json",
            success: function (result) {
                var jposts = result.d;
                var mensaje;
                var titulo;

                if (result.d != "fail") {
                    downloadURL(result.d, "ExcelFiles");
                }
                else if (result.d == "fail") {
                    mensaje = "fail, please try again";
                    titulo = "anim error";
                    new Messi(mensaje,
                    { title: 'User Proccess', titleClass: titulo, modal: true, buttons: [{ id: 0, label: 'Close', val: 'X' }] });
                }
            },
            error: AjaxtoPDFFailed
        });

    }

    

    function downloadURL(url, carpeta) {

        iframe = document.getElementById("hiddenDownloader");
        if (iframe === null) {
            iframe = document.createElement('iframe');
            iframe.id = "hiddenDownloader";
            iframe.style.visibility = 'hidden';
            document.body.appendChild(iframe);
        }
        iframe.src = "DescargarArchivo.ashx?file=" + url + "&carpeta=" + carpeta;
    }

    function AjaxtoPDFFailed(result) {
        alert(result.status + ' ' + result.statusText);
    }


    //Cargar Datos Feedback
    function cargarDatosFeedback() {
        
        $.ajax({
            type: "POST",
            url: "report.aspx/getDatosReg2",
            contentType: "application/json; charset=utf-8",
            data: "{ }",
            dataType: "json",
            success: AjaxGetFieldDataSucceeded2,
            error: AjaxGetFieldDataFailed2
        });
    }

    function cargarDatosFeedback2() {

        $.ajax({
            type: "POST",
            url: "report.aspx/getDatosReg2",
            contentType: "application/json; charset=utf-8",
            data: "{ }",
            dataType: "json",
            success: AjaxRefreshDataSucceeded2,
            error: AjaxRefreshDataFailed2
        });
    }

    function AjaxRefreshDataSucceeded2(result) {
        if (result.d != "[]") {
            var jposts = result.d;
            var mensaje;
            var titulo;
            dataTab2 = $.parseJSON(jposts);
            oTable2.fnClearTable();
            oTable2.fnAddData(dataTab);
        } else {
            oTable2.fnClearTable();
            message("No data found", "Alert", "danger");
        }
    }

    function AjaxRefreshDataFailed2(result) {
        alert(result.status + ' ' + result.statusText);
    }

    function AjaxGetFieldDataFailed2(result) {
        alert(result.status + ' ' + result.statusText);
    }

    function AjaxGetFieldDataSucceeded2(result) {
        if (result.d != "[]") {
            var jposts = result.d;
            var mensaje;
            var titulo;
            try {
                dataTab2 = $.parseJSON(jposts);
            } catch (exception) {
                dataTab2 = "error";
            }
            if (dataTab2 != "error") {
                $("#datatables2").css("visibility", "visible");
                oTable2 = $('#datatables2').dataTable({
                    "bProcessing": true,
                    "aaData": dataTab2,
                    "aoColumns": [{ "mDataProp": "id" }, { "mDataProp": "overall" }, { "mDataProp": "comments" }, { "mDataProp": "email" }, { "mDataProp": "language" }, { "mDataProp": "registerDate" }],
                    "sPaginationType": "bootstrap",
                    "aaSorting": [[0, "asc"]],
                    "bJQueryUI": true
                });
            };
           
        } else {
            
            message("No data found", "Information", "danger");

        }

    }
	
	 //Cargar Datos Share Content
    function cargarDatosShare() {
        
        $.ajax({
            type: "POST",
            url: "report.aspx/getDatosReg3",
            contentType: "application/json; charset=utf-8",
            data: "{ }",
            dataType: "json",
            success: AjaxGetFieldDataSucceeded3,
            error: AjaxGetFieldDataFailed3
        });
    }

    function cargarDatosShare3() {

        $.ajax({
            type: "POST",
            url: "report.aspx/getDatosReg3",
            contentType: "application/json; charset=utf-8",
            data: "{ }",
            dataType: "json",
            success: AjaxRefreshDataSucceeded3,
            error: AjaxRefreshDataFailed3
        });
    }

    function AjaxRefreshDataSucceeded3(result) {
        if (result.d != "[]") {
            var jposts = result.d;
            var mensaje;
            var titulo;
            dataTab3 = $.parseJSON(jposts);
            oTable3.fnClearTable();
            oTable3.fnAddData(dataTab);
        } else {
            oTable3.fnClearTable();
            message("No data found", "Alert", "danger");
        }
    }

    function AjaxRefreshDataFailed3(result) {
        alert(result.status + ' ' + result.statusText);
    }

    function AjaxGetFieldDataFailed3(result) {
        alert(result.status + ' ' + result.statusText);
    }

    function AjaxGetFieldDataSucceeded3(result) {
        if (result.d != "[]") {
            var jposts = result.d;
            var mensaje;
            var titulo;
            try {
                dataTab3 = $.parseJSON(jposts);
            } catch (exception) {
                dataTab3 = "error";
            }
            if (dataTab3 != "error") {
                $("#datatables3").css("visibility", "visible");
                oTable3 = $('#datatables3').dataTable({
                    "bProcessing": true,
                    "aaData": dataTab3,
                    "aoColumns": [{ "mDataProp": "id" }, { "mDataProp": "registerDate" }, { "mDataProp": "name" }, { "mDataProp": "mailto" }, { "mDataProp": "comments" }],
                    "sPaginationType": "bootstrap",
                    "aaSorting": [[0, "asc"]],
                    "bJQueryUI": true
                });
            };
           
        } else {
            
            message("No data found", "Information", "danger");

        }

    }
	
	