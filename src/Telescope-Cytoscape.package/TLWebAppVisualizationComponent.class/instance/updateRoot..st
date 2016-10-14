rendering
updateRoot: anHtmlRoot
self flag:'Il faudrait voir comment on peut changer facilement le titre de l onglet qui sera ouvert'.
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'User Visualization' .
	anHtmlRoot stylesheet
		url: (WAUrl absolute: 'https://storage.googleapis.com/code.getmdl.io/1.0.0/material.indigo-pink.min.css').
	anHtmlRoot script url: (WAUrl absolute: 'https://storage.googleapis.com/code.getmdl.io/1.0.0/material.min.js').
	
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/icon?family=Material+Icons')