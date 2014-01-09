jQuery(document).ready(function () {
        var $container = $('#PinContainer');
        $container.imagesLoaded(function () {
            $container.masonry({
                isFitWidth: true,
                itemSelector:'.box',
                isAnimated:true,
                animationOptions:{
                    duration:150,
                    easing:'linear',
                    queue:false
                }
            });
        });
    })