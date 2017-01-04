accessing
allDemoName
	^ TLDemos class methods select: [:m | m protocol = #demos or: [ m protocol = #'*Telescope-Cytoscape' ] ] 