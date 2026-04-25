var FormFileUpload = function () {
	var maxAllowedSize = _maxAllowedFiles;
	if (typeof  maxAllowedSize == 'undefined') {
		maxAllowedSize = 1;
	}
	
    return {
        //main function to initiate the module
        init: function () {

             // Initialize the jQuery File Upload widget:
            $('#fileupload').fileupload({
                disableImageResize: false,
                autoUpload: false,
                disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent),
                maxFileSize: 600000,//600 kb in bytes
                maxNumberOfFiles: maxAllowedSize,
                formAcceptCharset: 'utf-8',
                type: 'POST',
                url:_contextPath+'/'+_controller+'/uploadImage',
                acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
                // Uncomment the following to send cross-domain cookies:
                //xhrFields: {withCredentials: true},                
            });

            // Enable iframe cross-domain access via redirect option:
            $('#fileupload').fileupload(
                'option',
                'redirect',
                window.location.href.replace(
                    /\/[^\/]*$/,
                    '/cors/result.html?%s'
                )
            );

            // Upload server status check for browsers with CORS support:
            if ($.support.cors) {
                $.ajax({
                    type: 'HEAD'
                }).fail(function () {
                    $('<div class="alert alert-danger"/>')
                        .text('Upload server currently unavailable - ' +
                                new Date())
                        .appendTo('#fileupload');
                });
            }

            // Load & display existing files:
            $('#fileupload').addClass('fileupload-processing');
            $.ajax({
                // Uncomment the following to send cross-domain cookies:
                //xhrFields: {withCredentials: true},
            	url:_contextPath+'/'+_controller+'/loadImages'+"?id="+$("#fileupload #id").val(),
                dataType: 'json',
                context: $('#fileupload')[0]
            }).always(function () {
                $(this).removeClass('fileupload-processing');
            }).done(function (result) {
                $(this).fileupload('option', 'done')
                .call(this, $.Event('done'), {result: result});
                $( "#_cancel" ).trigger( "click" );
            });
        }

    };

}();

jQuery(document).ready(function() {
    FormFileUpload.init();
});


