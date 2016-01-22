as yet unclassified
testAllDemos
	TLDemos class methods select: [:m | m protocol = #demos ] thenDo: [ :m | (TLDemos perform: m selector) open; close ].