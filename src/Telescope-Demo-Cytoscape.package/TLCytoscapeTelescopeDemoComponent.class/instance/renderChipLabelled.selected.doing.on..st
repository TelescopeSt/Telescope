rendering
renderChipLabelled: label selected: aBoolean doing: aBlock on: html
	html span
		class: #chip;
		class: #isSelected if: aBoolean;
		onClick:
				(html jQuery
						script: [ :s | 
							s
								<<
									((html jQuery id: #'telescope-filters') load
										html: [ :r | 
											aBlock value.
											self renderFiltersOn: r ]).
							s << ((html jQuery id: #'telescope-selection__list') load html: [ :r | self renderListContentOn: r ]) ]);
		with: [ html span: label ]