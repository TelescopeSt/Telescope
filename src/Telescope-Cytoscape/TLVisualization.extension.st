Extension { #name : #TLVisualization }

{ #category : #'*Telescope-Cytoscape' }
TLVisualization >> ensureWebAppVisualizationComponentIsRunning [

	TLWebAppVisualizationComponent ensureIsRunning.
]

{ #category : #'*Telescope-Cytoscape' }
TLVisualization >> openOnWeb [
	| webAppVisualization port |
	self ensureWebAppVisualizationComponentIsRunning.
	webAppVisualization := TLWebAppVisualization singleton.
	webAppVisualization visualization: self.
	WAServerManager default adaptors
		ifEmpty: [ 
			(ZnZincServerAdaptor
				port: (port := 8080))
				start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ 
					(ZnZincServerAdaptor
						port: (port := 8080))
						start ] ].
	OSProcess command: 'open http://localhost:' , port asString , '/UserVisualization'
]
