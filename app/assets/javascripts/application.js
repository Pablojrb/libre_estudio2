// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

(function ($) {
  // var $mobileNavToggleBtn = $('mobile-nav-t');
  // function onBtnClick(e) {
  //   var $selectors = $('mobile-nav-t','mobile-nav');
  //   $selectors.toggleClass('is-open');
  // }

  $(document).ready(function(){
    // $mobileNavToggleBtn.on('click',onBtnClick)
    setTimeout(function(){
      $('#notice_wrapper').fadeOut("slow", function() {
        $(this).remove();
      })
    },2500);
    consola();
    mobileNav();

  });

})(jQuery);

function mobileNav(){

  $('mobile-nav-t').click(function(){

    console.log("clikeado");
    var status = $('this').hasClass('.is-open');
    if(status){$('.mobile-nav-t','.mobile-nav').removeClass('.is-open');}
    else{$('.mobile-nav-t','.mobile-nav').addClass('.is-open');}
  });
}
function consola(){
  console.log("hola mundo munaskjdhaskjdo");
}
