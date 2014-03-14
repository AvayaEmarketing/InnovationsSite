<%@ Page Language="C#" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" />
    <title>Feedback Innovations Magazine - Avaya</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="developer" content="William Ballesteros Blanco (wballesteros@avaya.com) - Avaya Inc. 2014">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap-dialog.css" rel="stylesheet" type="text/css" />
    
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
                        <h2>Feedback</h2>

                        <h3>Your feedback is important to us.</h3>

                       
                        <div class="form-horizontal" id="formulario">
                            <label class="control-label" for="company">Overall, how satisﬁed are you with the magazine?</label>
                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Very Satisfied"/> <label >Very Satisfied</label>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Satisfied"/> <label >Satisfied</label>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Neutral"/> <label >Neutral</label>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Dissatisﬁed"/> <label >Dissatisﬁed</label>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="overall" value="Very Dissatisﬁed"/> <label >Very Dissatisﬁed</label>
                                </div>
                            </div>

                            
                            <div class="control-group">
                                <label class="control-label" for="comments">We welcome any additional suggestions or thoughts you’d like to share</label>
                                <div class="controls">
                                    <textarea id="comments" rows="5"></textarea>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="email">If you would like a response please provide your email address</label>
                                <div class="controls">
                                    <input type="text" id="email" />
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
    <script type="text/javascript" src="js/feedback.js"></script>
    <!--[if lte IE 7]><script src="js/lte-ie7.js"></script><![endif]-->
    <!-- Por si usan exploradores viejos -->
    <script type="text/javascript" src="js/html5shiv.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <script type="text/javascript" src="js/modernizr-2.6.2.js"></script>
</body>
</html>
