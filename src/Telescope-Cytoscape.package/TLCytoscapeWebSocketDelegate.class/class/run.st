as yet unclassified
run
	<script>
	singleton
		ifNil: [ 
			singleton := ZnServer startOn: 1701.
			singleton delegate: TLCytoscapeWebSocketDelegate new ]