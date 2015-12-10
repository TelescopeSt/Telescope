accessing
removed
	self fromNode removeOutgoingConnection: self.
	self toNode removeIncomingConnection: self.
	self fromNode: nil.
	self toNode: nil.