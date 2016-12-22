as yet unclassified
renderContentOn: html
	html
		orderedList: [ 
			TLDemos allDemoName
				do: [ :each | 
					html listItem
						onClick:
								((html jQuery id: 'view') load
										html: [ :r | 
											self method: each selector.
											self renderDemo: r ];
								onComplete:'telescope.loadVisuIn(document);');
						with: each selector ] ].
	self renderDemo: html