jQuery(document).ready(function () {
  var $container = $('#PinContainer');
  $container.imagesLoaded(function () {
      $container.masonry({
          isFitWidth: true,
          isResizable: true,
          itemSelector:'.box', 
          columnWidth: function( containerWidth ) {
              return (containerWidth -10) / 36;
          },
          isAnimated:true,
          animationOptions:{
              duration:150,
              easing:'linear',
              queue:false
          }
          
      });
  });

  $container.infinitescroll({
    navSelector  : '#page-nav',    // selector for the paged navigation 
    nextSelector : '#page-nav a',  // selector for the NEXT link (to page 2)
    itemSelector : '.box',     // selector for all items you'll retrieve
    loading: {
        finishedMsg: 'No more pages to load.',
        img: 'http://i.imgur.com/6RMhx.gif'
      }
    },
    // trigger Masonry as a callback
    function( newElements ) {

      // get new #page-nav
      var nexPageNav = $(this).find('#page-nav');

      // substitute current #page-nav with new #page-nav from page loaded
      $('#page-nav').replaceWith(nexPageNav);


      // hide new items while they are loading
      var $newElems = $( newElements ).css({ opacity: 0 });
      // ensure that images load before adding to masonry layout
      $newElems.imagesLoaded(function(){
        // show elems now they're ready
        $newElems.animate({ opacity: 1 });
        $container.masonry( 'appended', $newElems, true ); 
      });
    }
  );

})
