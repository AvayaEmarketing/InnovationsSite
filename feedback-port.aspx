﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" />
    <title>Avaya Innovations Magazine</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shortcut icon" href="assets/img/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="assets/img/favicon-ios.png">
    <meta name="apple-mobile-web-app-title" content="Avaya Innovations Magazine">

    <script src="assets/js/modernizr.custom.15697.js"></script>


    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
    <link rel="stylesheet" href="assets/css/font-awesome.css">
    <link href="css/bootstrap-dialog.css" rel="stylesheet" type="text/css" />

    <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50254038-1', 'avaya.com');
  ga('require', 'displayfeatures');
  ga('send', 'pageview');

</script>
    
</head>

<body class="zero">




    <header class="row-fluid navbarred">
        <div class="container">
            <div class="span12">
                <div class="span6"><a href="index.html" target="blank"><img src="assets/img/avaya.png" alt=""></a></div>
                <div class="span6 hidden-phone">
                    <ul>
                        <li><a href="spanish.html">Espanhol</a></li>
                        <li><a href="english.html">Inglês</a></li>
                        <li><a href="portuguese.html">Português</a></li>
                        <li class="hidden-phone"><a href="#" class="feed" rel="tooltip"  data-toggle="tooltip" data-placement="bottom" title="Feedback"><img src="assets/img/feedback.png" alt=""></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    
    <div class="menumobile visible-phone">
        <ul id="nav">
            <li><a href="spanish.html">Espanhol</a></li>
            <li><a href="english.html">Inglês</a></li>
            <li><a href="portuguese.html">Português</a></li>
            <li class="feedmobile"><a href="#">Feedback</a></li>
        </ul>
    </div>




    

    <section class="row-fluid contphone">
        <div class="container">
            <div class="span12 tittlelang">
                <div class="span10 substitle"><h2>Feedback</h2></div>
                <div class="span2 hidden-phone"><img src="assets/img/invlogo.png" alt=""></div>
            </div>
        </div>
    </section>




    <div class="row-fluid">
        <div class="container">
            <div class="span6 feedback">
                
            

                        <h3>Seu feedback &eacute; muito importante para n&oacute;s.</h3>

                       
                        <div class="form-horizontal" id="formulario">
                            <label class="control-label" for="company">No geral, qu&atilde;o satisfeito voc&ecirc; est&aacute; com a revista? </label>
                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Very Satisfied"/> <label >Muito satisfeito</label>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Satisfied"/> <label >Satisfeito</label>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Neutral"/> <label >Neutro</label>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Dissatisﬁed"/> <label >Insatisfeito </label>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Very Dissatisﬁed"/> <label >Muito insatisfeito </label>
                                </div>
                            </div>

                            
                            <div class="control-group">
                                <label class="control-label" for="comments">Agradecemos qualquer sugest&atilde;o ou opini&atilde;o adicional que voc&ecirc; deseje compartilhar conosco</label>
                                <div class="controls">
                                    <textarea class="textarea" id="comments" rows="5"></textarea>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="email">caso voc&ecirc; deseje obter uma resposta, por favor, forne&ccedil;a seu endere&ccedil;o de e-mail</label>
                                <div class="controls">
                                    <input class="textarea" type="text" id="email" />
                                </div>
                            </div>

                            
                            <div class="control-group">
                                <div class="controls">
                                    <button style="top: 0 !important;" type="submit" class="submit" id="Register"><i class="fa fa-envelope"></i> Enviar</button>
                                </div>
                            </div>
                        </div>

            </div>
            <div class="span6 imgfeed hidden-phone">
                <img src="assets/img/feedbackimg.jpg" alt="">
            </div>
        </div>
    </div>




    <div class="container">
        <div class="row-fluid">


            <div class="span9">

                <hr style="margin-top: 0;">

                <div class="row-fluid">
                    <div class="span12">
                        


                    </div>
                </div>


            </div>
        </div>
    </div>

   

    <!-- Footer
    ================================================== -->
    <footer class="footer">

        
    </footer>




    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-dialog.js"></script>
    
    <script type="text/javascript" src="js/feedback.js"></script>
    <!--[if lte IE 7]><script src="js/lte-ie7.js"></script><![endif]-->
    <!-- Por si usan exploradores viejos -->
   
    <script type="text/javascript" src="js/json2.js"></script>


        <script type="text/javascript">  
            
            jQuery(function($){
                $('.bar').mosaic({
                    animation   :   'slide'
                });
            });
            
    </script>

   <script type="text/javascript" src="assets/js/mosaic.1.0.1.js"></script>

    <script type="text/javascript">  
            
            jQuery(function($){
                $('.bar').mosaic({
                    animation   :   'slide'
                });
            });
            
    </script>

<script type="text/javascript">
    $("#nav").addClass("js").before('<div id="menu">&#9776;</div>');
    $("#menu").click(function(){
        $("#nav").toggle();
    });
    $(window).resize(function(){
        if(window.innerWidth > 768) {
            $("#nav").removeAttr("style");
        }
    });
</script>
</body>
</html>
