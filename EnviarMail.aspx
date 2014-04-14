<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EnviarMail.aspx.cs" Inherits="EnviarMail1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-modal-bs3patch.css" rel="stylesheet" />
    <link href="Content/bootstrap-modal.css" rel="stylesheet" />
</head>
<body>
     <input id="button1" type="button" value="button" />

    <!-- Modal HTML Message-->
    <div id="shareContent" class="modal fade" tabindex="-1" data-width="600" style="display: none;">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Compartir con un amigo.</h4>
        </div>
        <div class="modal-body">
            <div><h5> De:</h5> 
                <p><input class="form-control" type="text" id="mail_from" /></p>                
            </div>
            
            <div><h5> Para "Digite los correos separados por comas (,)":</h5> 
                <p><input class="form-control" type="text" id="mails" /></p>                
            </div>
             <div><h5> Mensaje:</h5> 
                <p>
                    <textarea class="form-control" rows="4" id="mensaje" ></textarea></p>                
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="Accept">Aceptar</button>
        </div>
    </div>

</body>

    <script src="Scripts/jquery-1.9.0.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
<script src="Scripts/bootstrap-modalmanager.js"></script>
<script src="Scripts/bootstrap-modal.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#button1').click(function () {
            $('#shareContent').modal('show');
        });

        $('#Accept').click(function () {
            var mails = $("#mails").val();
            var mail_from = $("#mail_from").val();
            var mensaje = $("#mensaje").val();
            enviar_correo(mail_from, mails, mensaje);
        });
    });

    function enviar_correo(de, para, mensaje) {

        var datae = {'mail_from': de, 'correo': para, 'mensaje':mensaje};
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

</script>
</html>
