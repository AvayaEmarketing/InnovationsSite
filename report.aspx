<%@ Page Language="C#" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="report" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" />
    <title>Report Innovations Magazine - Avaya</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="developer" content="William Ballesteros Blanco (wballesteros@avaya.com) - Avaya Inc. 2014">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/prettyLoader.css" rel="stylesheet">
    <link href="css/DT_bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-dialog.css" rel="stylesheet" type="text/css" />
    <link href="css/calendar.css" rel="stylesheet" type="text/css" />

    <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50254038-1', 'avaya.com');
  ga('require', 'displayfeatures');
  ga('send', 'pageview');

</script>


    <style>
        .btn-file {
            position: relative;
            overflow: hidden;
        }

            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 150%;
                min-height: 100%;
                font-size: 999px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                background: red;
                cursor: inherit;
                display: block;
            }

        p.description {
            font-size: 0.8em;
            padding: 0 1em 1em;
            margin: 0;
        }

        #message {
            font-size: 0.7em;
            position: absolute;
            top: 1em;
            right: 1em;
            width: 350px;
            display: none;
            padding: 1em;
            background: #ffc;
            border: 1px solid #dda;
        }

        .btn-twitter {
			padding-left: 30px;
			background: rgba(0, 0, 0, 0) url(img/twitterIcon.png) -20px 6px no-repeat;
			background-position: -20px 11px !important;
		}
		.btn-twitter:hover {
			background-position:  -20px -18px !important;
		}
    </style>

    
</head>

<body>



    <!-- NAVBAR
    ================================================== -->
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">


                <a class="brand" href="http://avaya.com">
                    <img class="desktop" src="images/avaya-logo.jpg" alt="Avaya" /><img class="mobile" src="images/avaya-logo-mobile.jpg" alt="Avaya" /></a>

                <button type="button" class="btn btn-navbar visible-phone" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <li><a href="#" id="subscribe">Subscribe</a></li>
                        <li><a href="#" id="feedback">Feedback</a></li>
                        <li><a href="#" id="share">Share Content</a></li>
                        <li><a href="#" id="exit">Exit</a></li>
                    </ul>
                </div>
                <!--/.nav-collapse -->

            </div>
        </div>
    </div>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->



    <div class="container" id="cont_subscribe">
        <div class="row-fluid">


            <div class="span9">

                <hr style="margin-top: 0;">

                <div class="row-fluid">
                    <div class="span12">
                        <h2>Innovations Magazine</h2>


                        <table id="datatables" cellpadding="0" cellspacing="0" border="0" style="width: 100%; text-align: center; visibility: hidden" class="table table-striped table-bordered">
                            <thead id="thead">
                                <tr>
                                    <th class="sorting" width="5%">ID</th>
                                    <th class="sorting" width="10%">Firstname</th>
                                    <th class="sorting" width="10%">Lastname</th>
                                    <th class="sorting" width="15%">Email</th>
                                    <th class="sorting" width="10%">Company</th>
                                    <th class="sorting" width="10%">Country</th>
                                    <th class="sorting" width="10%">Business Size</th>
                                    <th class="sorting" width="10%">Language</th>
                                    <th class="sorting" width="15%">Register Date</th>
                                    


                                </tr>
                            </thead>
                            <tbody id="tbody">
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td>
                                        <div id="toExcel">
                                            <a href="#" id="btnDescargaExcel"><img src="images/xls.png" alt="to Excel" /></a>
                                        </div>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>


                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <div class="container" id="cont_feedback" style="display:none;">
        <div class="row-fluid">


            <div class="span9">

                <hr style="margin-top: 0;">

                <div class="row-fluid">
                    <div class="span12">
                        <h2>Innovations Magazine</h2>


                        <table id="datatables2" cellpadding="0" cellspacing="0" border="0" style="width: 100%; text-align: center; visibility: hidden" class="table table-striped table-bordered">
                            <thead id="thead1">
                                <tr>
                                    <th class="sorting" width="5%">ID</th>
                                    <th class="sorting" width="10%">Satisfied</th>
                                    <th class="sorting" width="45%">Comments</th>
                                    <th class="sorting" width="15%">Email</th>
                                    <th class="sorting" width="10%">Language</th>
                                    <th class="sorting" width="15%">Register Date</th>
                                </tr>
                            </thead>
                            <tbody id="tbody1">
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td>
                                        <div id="toExcel2">
                                            <a href="#" id="btnDescargaExcel2"><img src="images/xls.png" alt="to Excel" /></a>
                                        </div>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    


                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Share Content -->
    <div class="container" id="cont_share" style="display:none;">
        <div class="row-fluid">


            <div class="span9">

                <hr style="margin-top: 0;">

                <div class="row-fluid">
                    <div class="span12">
                        <h2>Innovations Magazine</h2>


                        <table id="datatables3" cellpadding="0" cellspacing="0" border="0" style="width: 100%; text-align: center; visibility: hidden" class="table table-striped table-bordered">
                            <thead id="thead2">
                                <tr>
                                    <th class="sorting" width="10%">ID</th>
                                    <th class="sorting" width="25%">Register Date</th>
                                    <th class="sorting" width="25%">Name</th>
                                    <th class="sorting" width="20%">Mailto</th>
                                    <th class="sorting" width="20%">Comments</th>
                                    
                                </tr>
                            </thead>
                            <tbody id="tbody2">
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td>
                                        <div id="Div2">
                                            <a href="#" id="toExcel3"><img src="images/xls.png" alt="to Excel" /></a>
                                        </div>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    


                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="modal hide" id="pleaseWaitDialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-header">
            <h1>Processing...</h1>
        </div>
        <div class="modal-body">
            <div class="progress progress-striped active">
                <div class="bar progress-bar-danger" style="width: 100%;"></div>
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
    <script type="text/javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/DT_bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap-dialog.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <script type='text/javascript' src='js/jquery-migrate-1.2.1.js'></script>
    <script type="text/javascript" src="js/report.js"></script>
    <!--[if lte IE 7]><script src="js/lte-ie7.js"></script><![endif]-->
</body>
</html>
