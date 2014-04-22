<%@ Page Language="C#" AutoEventWireup="true" CodeFile="subscribe.aspx.cs" Inherits="subscribe" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" />
    <title>Subscribe Innovations Magazine - Avaya</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="developer" content="William Ballesteros Blanco (wballesteros@avaya.com) - Avaya Inc. 2014">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
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

<body>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container">
        <div class="row-fluid">


            <div class="span9">

                <hr style="margin-top: 0;">

                <div class="row-fluid">
                    <div class="span12">
                        <h2>Subscribe</h2>

                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label" for="fistname">First name<span style="color: #cc0000;">*</span></label>
                                <div class="controls">
                                    <input id="firstname" type="text" placeholder="First Name" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="lastname">Last name<span style="color: #cc0000;">*</span></label>
                                <div class="controls">
                                    <input id="lastname" type="text" placeholder="Last Name" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="email">Email Address<span style="color: #cc0000;">*</span></label>
                                <div class="controls">
                                    <input id="email" type="text" placeholder="Email Address" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="company">Company<span style="color: #cc0000;">*</span></label>
                                <div class="controls">
                                    <input id="company" type="text" placeholder="Company" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="company">Country name<span style="color: #cc0000;">*</span></label>
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
                                    <button style="top: 0 !important;" type="submit" class="btn btn-danger" id="Register">Send</button>
                                </div>
                            </div>
                        </div>


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
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-dialog.js"></script>
    <script type="text/javascript" src="js/subscribe.js"></script>
    <!--[if lte IE 7]><script src="js/lte-ie7.js"></script><![endif]-->
    <!-- Por si usan exploradores viejos -->
    <script type="text/javascript" src="js/html5shiv.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <script type="text/javascript" src="js/modernizr-2.6.2.js"></script>
</body>
</html>
