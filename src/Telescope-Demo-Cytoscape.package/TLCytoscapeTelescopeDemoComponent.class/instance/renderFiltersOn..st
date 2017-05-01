rendering
renderFiltersOn: html
	self
		renderChipLabelled: 'All'
		selected: self filters size = self allFilters size
		doing: [ self filters addAll: self allFilters ]
		on: html.
	self
		renderChipLabelled: 'Remove All'
		selected: self filters isEmpty
		doing: [ self filters removeAll ]
		on: html.
	self allFilters
		do: [ :filter | 
			self
				renderChipLabelled: filter filterSymbol capitalized
				selected: (self filters includes: filter)
				doing: [ self toggleFilter: filter ]
				on: html ]