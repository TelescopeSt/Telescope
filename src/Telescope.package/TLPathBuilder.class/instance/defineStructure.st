building
defineStructure
	self layout: (TLLinearLayout gap: 60).
	self > #incomingCalls
		layout:
			(TLLinearLayout topToBottom
				gap: 20;
				yourself).
	self > #callNodes
		layout:
			(TLLinearLayout new
				verticalGap: 40;
				horizontalGap: 60).
	self > #outgoingCalls
		layout:
			(TLLinearLayout topToBottom
				gap: 20;
				yourself)