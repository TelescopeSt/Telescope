iterating
from: collection select: aBlockClosure into: selection
	selection add: collection.
	self source from: collection select: aBlockClosure into: selection