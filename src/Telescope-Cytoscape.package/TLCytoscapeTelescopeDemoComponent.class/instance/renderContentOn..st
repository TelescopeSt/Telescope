rendering
renderContentOn: html
	(html tag: #main)
		with: [ html div
				id: 'telescope-filters';
				with: [ self renderFiltersOn: html ].
			html div
				id: 'telescope-content';
				with: [ self renderMainContentOn: html ] ].
	html document addLoadScript: (JSStream on: 'hljs.initHighlighting();initResizer();initTabs();')