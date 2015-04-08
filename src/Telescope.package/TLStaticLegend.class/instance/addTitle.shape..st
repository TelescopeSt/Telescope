adding
addTitle: aTitle shape: aTLShape
	self requireUpdate.
	(self items contains: [ :item | item title text = aTitle ])
		ifFalse: [ 
			self items
				add:
					(TLLegendItem new
						title: aTitle;
						shape: aTLShape) ]