adding
addTitle: aTitle color: aColor
	self requireUpdate.
	(self items contains: [ :item | item title = aTitle ])
		ifFalse: [ 
			self items
				add:
					(TLLegendItem new
						title: aTitle;
						parent: self;
						backgroundColor: aColor) ]