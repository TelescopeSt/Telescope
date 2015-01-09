accessing
defaultInteractions: aCollectionOfTLInteractions
	self interactions removeAll: self defaultInteractions.
	defaultInteractions := aCollectionOfTLInteractions.
	self interactions addAll: aCollectionOfTLInteractions
	