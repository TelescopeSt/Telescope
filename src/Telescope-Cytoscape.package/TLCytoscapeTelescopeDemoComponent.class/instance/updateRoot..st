updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Telescope web demo'.
	anHtmlRoot script url: 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/highlight.min.js'.
	anHtmlRoot script url: 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/smalltalk.min.js'.
	anHtmlRoot script contents: 'hljs.initHighlightingOnLoad();'