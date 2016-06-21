accessing
initialize
	super initialize.
	self children: (TLVirtualGroup new composite: self).
	self userFixedPosition: false