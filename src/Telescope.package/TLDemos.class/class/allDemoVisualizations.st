accessing
allDemoVisualizations
	^ TLDemos class methods
		select: [ :m | m protocol = #demos or: [ m protocol = #'*Telescope-Cytoscape' ] ]
		thenCollect: [ :m | TLDemos perform: m selector ]