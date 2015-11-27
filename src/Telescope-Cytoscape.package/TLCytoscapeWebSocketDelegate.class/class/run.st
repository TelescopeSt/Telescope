as yet unclassified
run
	singleton
		ifNil: [ 
			singleton := ZnServer startOn: 1701.
			singleton delegate: TLCytoscapeWebSocketDelegate new ]