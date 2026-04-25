'use strict';
var itemFormFileUpload;
$(document).ready(function() {
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			resetMessageAndErrors();

			if($(e.target).attr('href')=='#tab_item_variant') {
				initItemVariantDataTable();
			} else if($(e.target).attr('href')=='#tab_item_translation') {
				initItemTranslationDataTable();
			} else if($(e.target).attr('href')=='#tab_item_image') {
            	showMessage("Note: You can 'drag and drop' the contents to change the display order on the client", "#item-edit-portlet-body");
			    // if lazy loading is required uncomment below but handle the duplicate contents
				//if(typeof itemFormFileUpload == 'undefined')
			    	//itemFormFileUpload = FormFileUpload.init();
			} else {
				//console.log("Perviously Selected Tab: "+e.relatedTarget); // previous tab
			}
		}
	);

/*	// this can be used to refresh the data table upon clicking a refresh button
 	$("#btnSearchItems").on("click", function(){
		itemVariantDataTable.draw();
	});
*/	

    $('#btn-create-item-var').on('click', function(event){
    	 event.preventDefault();
      // create the backdrop and wait for next modal to be triggered
      $('body').modalmanager('loading');
      //resetForm("#itemVariantForm");
      var el = $(this);
      var $modal = $('#item-variant-modal');
      
      setTimeout(function(){
          $modal.load(_contextPath+"/item/createItemVariant?itemId="+$("#itemId").val(), '', function(){
          $modal.modal({
        	  backdrop: 'static',
        	  keyboard: true
        	  }
          );
        });
      }, 0);
    });
    

    $('#btnAdd-item-var-trans').on('click', function(event){
     	 event.preventDefault();
       // create the backdrop and wait for next modal to be triggered
       $('body').modalmanager('loading');
       var el = $(this);
       var $modal = $('#item-trans-modal');
       setTimeout(function(){
           $modal.load(el.attr('data-url'), '', function(){
           $modal.modal({
         	  backdrop: 'static',
         	  keyboard: true
         	  }
           );
         });
       }, 500);
     });
    
    //initialize the translation data table
	//initItemVariantTranslationDataTable();
    
});
