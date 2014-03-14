<%@ Page Language="C#" AutoEventWireup="true" CodeFile="subscribe.aspx.cs" Inherits="subscribe" %>

<!doctype html>
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
    
</head>

<body class="zero">




    <header class="row-fluid navbarred">
        <div class="container">
            <div class="span12">
                <div class="span6"><a href="index.html" target="blank"><img src="assets/img/avaya.png" alt=""></a></div>
                <div class="span6 hidden-phone">
                    <ul>
                        <li><a href="spanish.html">Spanish</a></li>
                        <li><a href="english.html">English</a></li>
                        <li><a href="portuguese.html">Portuguese</a></li>
                        <li class="hidden-phone"><a href="feedback-eng.aspx" class="feed" rel="tooltip"  data-toggle="tooltip" data-placement="bottom" title="Feedback"><img src="assets/img/feedback.png" alt=""></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    
    <div class="menumobile visible-phone">
        <ul id="nav">
            <li><a href="spanish.html">Spanish</a></li>
            <li><a href="english.html">English</a></li>
            <li><a href="portuguese.html">Portuguese</a></li>
            <li class="feedmobile"><a href="feedback-eng.aspx">Feedback</a></li>
        </ul>
    </div>







    

    <section class="row-fluid contphone">
        <div class="container">
            <div class="span12 tittlelang">
                <div class="span10 substitle"><h2>Subscribe</h2></div>
                <div class="span2 hidden-phone"><img src="assets/img/invlogo.png" alt=""></div>
            </div>
        </div>
    </section>



    <div class="row-fluid">
        <div class="container">
            <div class="span6 subsform">
                
                
            <div class="textsubs">
                <p>
                    <em>Subscribe to the Avaya Magazine and discover how the next generation of business solutions can benefit your organization.</em>
                </p>
            </div>

                <div class="form-horizontal">

                            <div class="control-group">
                                <label class="control-label" for="fistname">Name<span style="color: #cc0000;">*</span></label>
                                <div class="controls">
                                    <input id="firstname" type="text" placeholder="Name" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="lastname">Last Name<span style="color: #cc0000;">*</span></label>
                                <div class="controls">
                                    <input id="lastname" type="text" placeholder="Last Name" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="email">Email<span style="color: #cc0000;">*</span></label>
                                <div class="controls">
                                    <input id="email" type="text" placeholder="Email" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="company">Company<span style="color: #cc0000;">*</span></label>
                                <div class="controls">
                                    <input id="company" type="text" placeholder="Company" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="company">Country<span style="color: #cc0000;">*</span></label>
                                <div class="controls">
                                    <select id="country"></select>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="company">Business Size<span style="color: #cc0000;">*</span></label>

                                <div class="controls">
                                    <select id="business">
                                        <option value="" selected="selected"></option>
                                        <option value="0 - 19">0 - 19</option>
                                        <option value="20 - 49">20 - 49</option>
                                        <option value="50 - 99">50 - 99</option>
                                        <option value="100 - 249">100 - 249</option>
                                        <option value="250 - 999">250 - 999</option>
                                        <option value="1000 - 4999">1000 - 4999</option>
                                        <option value="5000 - 19999">5000 - 19999</option>
                                        <option value="20000+">20000+</option>
                                    </select>
                                </div>

                             </div>

                            <div class="control-group">
                                <div class="controls">
                                    <button style="top: 0 !important;" type="submit" class="submit" id="Register"><i class="fa fa-envelope"></i> Submit</button>
                                </div>
                            </div>

                 </div>

                




            </div>

            <div class="span6 subscribeimg hidden-phone">
                
                <img src="assets/img/subscribeimg.png" alt="">
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
    <script src="assets/js/prefixfree.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/bootstrap-tooltip.js"></script>
    <script src="assets/js/jquery.hcaptions.js"></script>

    <script type="text/javascript">
$(function () {
$("[data-toggle='tooltip']").tooltip();
});
</script>

<script>
    $(window).load(function(){
  $('.hcaption').hcaptions();
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

    <!--[if lte IE 7]><script src="js/lte-ie7.js"></script><![endif]-->
    <!-- Por si usan exploradores viejos -->
    <script type="text/javascript" src="assets/js/html5shiv.js"></script>
    <script type="text/javascript" src="assets/js/json2.js"></script>
    <script type="text/javascript" src="assets/js/modernizr-2.6.2.js"></script>
</body>
</html>
