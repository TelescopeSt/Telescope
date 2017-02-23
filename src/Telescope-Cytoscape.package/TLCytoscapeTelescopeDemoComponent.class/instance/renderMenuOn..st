rendering
renderMenuOn: html
	html unorderedList
		class: 'menu';
		with: [ 
					TLDemos allDemoName
						do: [ :each | 
							html listItem
								onClick:
										((html jQuery id: 'view') load
												html: [ :r | 
															self method: each selector.
															self renderDemoOn: r ];
												onComplete: 'telescope.loadVisuIn(document);');
								with: (each selector allButFirst: 7) ] ]