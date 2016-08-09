layout
applyLayoutOf: aTLGroup on: group
	self commandsQueue managePositioningOf: group.
	group restoreElementsPosition.
	[ aTLGroup layout on: group ]
		on: TLNodeDimensionChanged
		do: [ :notification | 
			self
				addCommand:
					(TLVisualizationCustomizeElementCommand new
						virtualNode: notification node;
						visuId: self visuId;
						style:
								{(#width -> notification node width).
									(#height -> notification node height)} asDictionary).
			notification resume ]