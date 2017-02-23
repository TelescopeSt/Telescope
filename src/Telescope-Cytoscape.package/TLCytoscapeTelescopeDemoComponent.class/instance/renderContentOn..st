rendering
renderContentOn: html
	(html tag: 'main')
		with: [ 
			self renderMenuOn: html.
			html div
				id: 'view';
				with: [ self renderDemoOn: html ] ]