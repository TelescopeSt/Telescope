accessing
allDemoVisualizations
	^ TLDemos class methods select: [:m | m protocol = #demos ] thenCollect: [ :m | (TLDemos perform: m selector) ]