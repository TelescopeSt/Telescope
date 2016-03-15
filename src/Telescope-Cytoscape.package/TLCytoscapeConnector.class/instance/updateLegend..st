updating - legend
updateLegend: aTLLegend
	self flag: 'Can be smarter than just removing and recreating legend'.
	aTLLegend removeWith: self.
	aTLLegend generateWith: self.