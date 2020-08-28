/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
    $('.map-menu-btn').click( function(){
       var target_id = $(this).attr('href');
       var target = target_id.replace('#' , '');
       hide_all_layers();
       if(target === 'weather')
       {
           $('.map-toc-box').hide();
           $('.map-toc-container').hide();
           $('#map_side_menu_close').hide();
           weatherPoints.show();
           CCTVPoints.show();
           $('#map_layers svg').show();
           showPoints = true;
           return false;
       }
       
       if(target === 'clear')
       {
           $('.map-toc-box').hide();
           $('.map-toc-container').hide();
           $('#map_side_menu_close').hide();
           //$('.agsjsTOCContent input[type=checkbox]').attr('checked', false);
           hide_all_layers();
           showPoints = false;
           hide_window = true;
           $('.infowindow').hide();
           return false;
       }
       $('.infowindow').hide();
       hide_window = true;
       
       $('#map_container').attr('data-hide', hide_window);
       $('.map-toc-box').hide();
       $('#map_side_menu_close').show();
       $('.map-toc-container').show();
       
       $(target_id).show();
       $(target_id + ' input:checkbox').removeAttr('checked');
       showPoints = false;
       return false;

    });
    
//    $(document).on('click', '.agsjsTOCContent input[type=checkbox]', function(){
//         $('.map-toc-box').hide();
//         $('.map-toc-container').hide();
//    });

    $(document).on('click', '#map_side_menu_close a', function(){
         $('.map-toc-box').hide();
         $('.map-toc-container').hide();
         $('#map_side_menu_close').hide();
    });
    
    
});



