as yet unclassified
run
	<script>
	singleton
		ifNil: [ 
			singleton := ZnServer startDefaultOn: self defaultPort.
			singleton delegate: TLCytoscapeWebSocketDelegate new ]