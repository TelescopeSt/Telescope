iterating
from: collection select: aSelectBlock thenDo: aDoBlock
	aSelectBlock cull: collection.
	self from: collection select: aSelectBlock thenDo: aDoBlock