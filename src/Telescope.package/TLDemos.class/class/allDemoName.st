accessing
allDemoName
	^ (TLDemos class methods select: [ :m | m protocol = #demos or: [ m protocol = #'*Telescope-Cytoscape' ] ])
		sort: [ :m1 :m2 | m1 selector < m2 selector ]