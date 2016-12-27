as yet unclassified
renderContentOn: html
	html div
		style: 'display: flex; height: 100vh;width: 100vw; overflow: auto;';
		with: [ 
					html
						unorderedList style: 'width: 400px;padding-left: 7px;list-style: none;';
						with: [ 
							TLDemos allDemoName
								do: [ :each | 
									html listItem
										onClick:
												((html jQuery id: 'view') load
														html: [ :r | 
																	self method: each selector.
																	self renderDemo: r ];
														onComplete: 'telescope.loadVisuIn(document);');
										with: each selector ] ].
					html div
						id: 'view';
						style: 'background: aliceblue; flex-grow:1; width:1px;';
						with: [ self renderDemo: html ] ]