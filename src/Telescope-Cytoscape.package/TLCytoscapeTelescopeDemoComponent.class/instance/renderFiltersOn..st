rendering
renderFiltersOn: html
	self allFilters
		do: [ :filter | 
			html span
				class: #chip;
				class: #isSelected if: (self filters includes: filter);
				onClick:
					(html jQuery
						script: [ :s | 
							s
								<<
									((html jQuery id: #'telescope-filters') load
										html: [ :r | 
											self toggleFilter: filter.
											self renderFiltersOn: r ]).
							s << ((html jQuery id: #'telescope-selection__list') load html: [ :r | self renderListContentOn: r ]) ]);
				with: [ html span: filter filterSymbol capitalized ] ]