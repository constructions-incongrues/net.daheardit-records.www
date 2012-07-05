<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Da ! Heart It Records - T'es perdu ?</title>
  <style>
html { 
  margin:0;
  padding:0;
  background: url(<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/merci.jpg) no-repeat center fixed; 
  -webkit-background-size: cover; /* pour Chrome et Safari */
  -moz-background-size: cover; /* pour Firefox */
  -o-background-size: cover; /* pour Opera */
  background-size: cover; /* version standardisée */
}

.click 
{
  margin:0;
  padding:0;
    background: url(<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/click.png) no-repeat center fixed; 

  -webkit-background-size: cover; /* pour Chrome et Safari */
  -moz-background-size: cover; /* pour Firefox */
  -o-background-size: cover; /* pour Opera */
  background-size: cover; /* version standardisée */
}
</style>

</head>
<body>
  <p><a href="<?php echo url_for('@homepage') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/errors/click.png" class="click"/></a></p>
</body>
</html>