"
Description
--------------------

I am a dynamic variable defining the current `Connector` to use to render a visualization.

Examples
--------------------

	TLCurrentConnector value: TLCytoscapeConnector during: [ 
		visualization open
	]
"
Class {
	#name : #TLCurrentConnector,
	#superclass : #DynamicVariable,
	#category : #'Telescope-Core-Connector'
}

{ #category : #accessing }
TLCurrentConnector >> default [
	^ (TLConnector allSubclasses select: #isRealConnector)
		ifEmpty: [ TLNoConnectorException signal ]
		ifNotEmpty: [ :connectors | connectors detectMax: #priority ]
]
