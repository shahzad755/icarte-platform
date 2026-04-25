var blockUIOptions = { 
		message: '<div class="">' + '<div class="block-spinner-bar"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>' + '</div>', 
		css: {width:'0px', border: '0px'},
        css: {
            top: '10%',
            border: '0',
            padding: '0',
            backgroundColor: 'none'
        },
        overlayCSS: {
            backgroundColor: '#212F3C',
            opacity: 0.4,
            cursor: 'wait'
        }
        };

function showError(message, beforeContainer, showTitle) {
	resetMessageAndErrors();
	var errorDiv = '<div id="_errorContainer" class="alert alert-danger alert-dismissable" role="status">'
		  + '<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>'
		  + (showTitle? '<h4>Error! Please correct the errors before proceeding </h4>' : '<h4>Error!</h4>')
		  + '<div id="errContent">'
		  + message
		  +	'</div>'
	+ '</div>';
	$(beforeContainer).before(errorDiv);
	//$("#errorContainer #errContent").html(message);
	//$("#errorContainer").show();
}

function showMessage(message, beforeContainer){
	resetMessageAndErrors();
	var messageDiv = '<div id="_message" class="message alert alert-info alert-dismissable" role="status">'
		+ '<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>'
		+ '<strong>Info!</strong> '
		+ message
		+ '</div>';
	$(beforeContainer).before(messageDiv);
}

function handleErrorResponse(jqXHR, textStatus, beforeContainer) {
	//Clear the existing errors if any
    $('.error').removeClass('error');
    var fld = null;
	var json = $.parseJSON(jqXHR.responseText);
	var errDet = "<ul>";
	if(json!==null){

		$.each(json.errors, function() {
			debug("Error in handleErrorResponse: "+this.error);
			errDet += "<li>"+this.error+ "</li>";
/*			debug('add error class... to '+ this.field);
			fld = $('#'+this.field).closest('.control-group');
			if(fld != null && fld.length > 0)
				fld.removeClass('success').addClass('error');
			else {//if the field was not found therefore fall back to class based selector approach
				$('.'+this.field).closest('.control-group').removeClass('success').addClass('error');
			}*/
		});

	} else {
		errDet = "Unable to connect to server or no response received...\nError:"+ textStatus;

	}
	showError(errDet, beforeContainer, true);
}

var isDebugEnabled = true;
function debug(message){
	if(isDebugEnabled)
		console.log('DEBUG: '+ message);
}

function resetForm(form) {
	//debug("Resetting form: "+ form);
	resetMessageAndErrors();
	$(form).find('input:text, input:password, input:hidden, select, textarea').val('');
    $(form).find('input:radio, input:checkbox').prop('checked', false);	
}

function resetMessageAndErrors(){
	$('#_message').remove();
	$('#_errorContainer').remove();
}

var fixHelper = function(e, ui) {
    ui.children().each(function() {
        $(this).width($(this).width());
    });
    return ui;
}

function fillSelectListWithJSONData(selectObj, json, valueToBeSelected, noSelectionTitle) {
	selectObj.children().remove();
	var option = $("<option />").val("").append(noSelectionTitle);
	selectObj.append(option);
	var selected_key = null;
	for (var i=0; i !== json.length; i++) {
        var key = json[i][0];
        var value = json[i][1];
        //debug("Key="+ key + ", value="+ value);
        /* Set the selected option from JSON. */
        if (valueToBeSelected == key) {
        	//debug("ValueToBeSelected="+ valueToBeSelected + ", matched");
            option = $("<option selected='selected'/>").val(key).append(value);
        } else {
        	//debug("ValueToBeSelected="+ valueToBeSelected + ", NOT matched");
            option = $("<option/>").val(key).append(value);
        }
        selectObj.append(option);
    }
}