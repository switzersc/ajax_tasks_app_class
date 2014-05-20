$ ->
	$('form#new_user').on "ajax:complete", (event, data, status, xhr) ->
		console.log(data)