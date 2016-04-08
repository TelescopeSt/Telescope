layout
configLayout
	self > #left layout: TLLinearLayout topToBottom.
	self > #central.
	self > #right layout: TLLinearLayout topToBottom.
	self layout: (TLLinearLayout gap: 100)