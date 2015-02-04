<comment-form>
	<hr>
	<form onSubmit={ add }>
		<input type="text" placeholder="Your name" name="author" />
		<input type="text" placeholder="Say something..." name="text" />
		<input type="submit" value="Post" />
	</form>

	<script>

	add(e) {

		var author = this.author.value.trim();
		var text = this.text.value.trim();
		
		if(!author || !text) {
			return;
		}

		opts.handle( {author: author, text: text} );

		this.author.value = '';
		this.text.value = '';
	}

	</script>
</comment-form>