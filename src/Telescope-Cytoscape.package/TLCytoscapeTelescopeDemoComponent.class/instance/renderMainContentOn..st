rendering
renderMainContentOn: html
	html div
		id: 'telescope-selection';
		with: [ html div
				id: 'telescope-selection__list';
				with: [ self renderListContentOn: html ].
			html div class: #resizer ].
	html div
		id: 'telescope-panel';
		with: [ self renderPanelsOn: html ]