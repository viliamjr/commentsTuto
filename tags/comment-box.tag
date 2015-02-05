<comment-box>

	<h1>Comments</h1>
	<comment-list data={ data }></comment-list>
	<comment-form handle={ handleNewComment }></comment-form>

	<script>

	loadCommentsFromServer() {
		
		$.ajax({
			url: opts.url,
			dataType: 'json',
			success: function(data) {
				this.update({ data: data });
			}.bind(this),
			error: function(xhr, status, err) {
				console.error(opts.url, status, err.toString());
			}.bind(this)
		});
	}

	handleNewComment(comment) {

		var comments = this.data;
		var newComments = comments.concat([comment]);

		this.update({ data: newComments });

		$.ajax({
			url: opts.url,
			dataType: 'json',
			type: 'POST',
			data: comment,
			success: function(data) {
				this.update({ data: data });
			}.bind(this),
			error: function(xhr, status, err) {
				console.error(opts.url, status, err.toString());
			}.bind(this)
		});
	}

	this.data = [];
	this.loadCommentsFromServer();
	setInterval(this.loadCommentsFromServer, opts.interval);

	</script>
</comment-box>