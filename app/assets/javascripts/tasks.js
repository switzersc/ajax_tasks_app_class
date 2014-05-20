$(function(){
	
	$(':checkbox').on('click', function(){

		var row 			= $(this).parents('tr'),
				task_id		= $(this).attr('data-task-id');

		$.ajax({
			url: 	"/tasks/" + task_id,
			type: 'PUT',
			data: {
				task: {
					"completed": true
				}
			},
			success: function(data){
				console.log(data);
				if (data == "1") {
					$(row).hide( "slow" );
				}
				else {
					console.log("false");
					$(row).addClass("failed");
				}
			}
		});

	});

	$('form#new_task').on('ajax:complete', function(event, data, status, xhr) {
		console.log(data);
	});

});