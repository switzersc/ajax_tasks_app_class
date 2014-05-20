$(function(){
	$('form#new_color').on('ajax:complete', function(event, data, status, xhr) {
		console.log(data);
	});
});