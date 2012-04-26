<div class="grid_12 releases">
        <div class="category_content">
          <h1>Biographie</h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle.png" class="triangle" /></span>
        </div><!-- end of category contents --> 
      </div><!-- end of releases -->

<div class="grid_12 open_artists"> 
  <div class="open_artists_content">
  
  <div class="grid_12">
    <ul class="open_releases_button">
      <li class="open_releases_button_left"> <a href="<?php echo url_for('@release_show?slug=dhr-'.$previous.'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Before" /> </a></li>

      <li  class="open_releases_button_right"> <a href="<?php echo url_for('@release_show?slug=dhr-'.$next.'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Previous" />  </a></li>
      <li class="open_releases_button_close"> <a href="" data-close="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Close" /> </a></li>
    </ul>
  </div>
  <hr /> 

    <div class="grid_6 open_artists_pictures">
    <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/artwork/cover_test.png" alt="" />
    </div><!-- end of grid_6 -->
    
    <div class="grid_6 open_releases_infos">

    <h1 class="open_artists_name">Jacques Cochise</h2>

    <p class="open_artists_bio">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum varius est id libero condimentum congue. Sed pellentesque metus sit amet mi hendrerit eleifend. Aliquam non ipsum et lacus aliquam accumsan sed a felis. Suspendisse ac nisl nec ipsum ullamcorper fermentum sed vitae nisl. Donec vel diam odio, vehicula eleifend justo. Sed nisi tellus, eleifend at imperdiet a, pharetra vel dolor. Aliquam id elit nulla. Etiam eu dui nec dui faucibus feugiat. Integer ligula justo, semper a fermentum vitae, ullamcorper in massa. Mauris vitae sapien non purus convallis tempus. Etiam volutpat dolor sapien, vel auctor leo. Donec justo nunc, congue ac molestie eget, accumsan quis metus. Vestibulum in lacus congue ligula blandit fermentum ut at justo.
    </p>

    <hr>
    <h2 class="open_artists_title">Ou le trouver ? </h2>

<div class="open_artists_linked">
    <ul>
      <li><a href="">Myspace</a></li>
      <li><a href="">Youtube</a></li>
      <li><a href="">Dailymotion</a></li>
    <ul>
</div>
    <hr>
    <h2 class="open_artists_title">Toutes les sorties  </h2>

 <div class=" open_artists_listing_releases ">
            <span class="calque_releases"> </span>
            <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/artwork/dhr-17_thumb-new.png" alt=""/>
            <h1><a href="">D!HR-17</a></h1>
            <h2><a href="">Jacques Cochise Vengeance</a></h2>
            <ul class="releases_discography_button">
              <li><a href="">+ D'infos</a></li>
              <li><a href="">Ajouter Au Panier</a></li>
            </ul>
          </div><!-- end of grid_3 releases_discography_number  -->
    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->

