<comment>

	<h2>{ opts.author }</h2>
	<raw-html danger={ commentRawMarkup } />

	<script>

	var converter = new Showdown.converter();
	this.commentRawMarkup = converter.makeHtml(opts.text);

	</script>
</comment>

<raw-html>
	<span></span>
	
	<script>

	this.root.innerHTML = opts.danger;

	</script>
</raw-html>