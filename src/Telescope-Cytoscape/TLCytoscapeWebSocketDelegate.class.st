"
I am the delegate that will registers visualizations and then manage requests
"
Class {
	#name : #TLCytoscapeWebSocketDelegate,
	#superclass : #ZnWebSocketDelegate,
	#instVars : [
		'visualizationByIdDictionary',
		'websocketByVisu'
	],
	#classInstVars : [
		'singleton',
		'development',
		'defaultPort'
	],
	#category : 'Telescope-Cytoscape'
}

{ #category : #'accessing-convenience' }
TLCytoscapeWebSocketDelegate class >> beDeployment [
	<script>
	self development: false
]

{ #category : #'accessing-convenience' }
TLCytoscapeWebSocketDelegate class >> beDevelopment [
	<script>
	self development: true
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate class >> defaultPort [
	^ defaultPort ifNil: [ defaultPort := 1701 ]
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate class >> defaultPort: aNumber [
	defaultPort := aNumber
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate class >> delegate [
	^ self singleton delegate
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate class >> development [
	^ development ifNil: [ development := false ]
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate class >> development: aBolean [
	development:= aBolean
]

{ #category : #'starting/stopping' }
TLCytoscapeWebSocketDelegate class >> ensureServerIsRunning [
	self singleton ifNil: [ self run ]
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate class >> port [
	self ensureServerIsRunning.
	^ self singleton port
]

{ #category : #registration }
TLCytoscapeWebSocketDelegate class >> registerVisualization: aTLVisualization underId: aDivId withCallBack: aCallBack callbackUrl: callbackUrl [
	self ensureServerIsRunning.
	self singleton delegate
		registerVisualization: aTLVisualization
		underId: aDivId
		withCallBack: aCallBack
		callbackUrl: callbackUrl
]

{ #category : #'starting/stopping' }
TLCytoscapeWebSocketDelegate class >> restart [
	<script>
	self stop.
	self run
]

{ #category : #'starting/stopping' }
TLCytoscapeWebSocketDelegate class >> run [
	<script>
	singleton
		ifNil: [ 
			singleton := ZnServer startDefaultOn: self defaultPort.
			singleton delegate: TLCytoscapeWebSocketDelegate new ]
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate class >> singleton [
	^ singleton
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate class >> singleton: anObject [
	singleton := anObject
]

{ #category : #'starting/stopping' }
TLCytoscapeWebSocketDelegate class >> stop [
	<script>
	singleton ifNotNil: #stop.
	singleton := nil
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate class >> visualizationWithId: aDivId [
	^ self singleton delegate visualizationWithId: aDivId
]

{ #category : #'as yet unclassified' }
TLCytoscapeWebSocketDelegate >> associateSocket: aWebSocket toVisuId: aVisuId [
	[ self websocketByVisu at: (self visualizationWithId: aVisuId) put: aWebSocket ]
		on: KeyNotFound
		do: [ TLGenerationErrorCommand new: aVisuId withMessage: self messageOnError on: aWebSocket ]
]

{ #category : #'as yet unclassified' }
TLCytoscapeWebSocketDelegate >> freeResourcesFor: webSocket [
	self websocketByVisu
		keysAndValuesRemove: [ :aVisu :aWebSocket | 
			aWebSocket = webSocket
				ifTrue: [ 
					self visualizationByIdDictionary removeKey: (self visualizationByIdDictionary keyAtValue: aVisu).
					true ]
				ifFalse: [ false ] ]
]

{ #category : #'as yet unclassified' }
TLCytoscapeWebSocketDelegate >> initialize [
	super initialize.
	self visualizationByIdDictionary: Dictionary new.
	self websocketByVisu: Dictionary new.
	self
		handler: [ :webSocket | 
			[ 
			[ webSocket runWith: [ :message | self onMessageReceived: message webSocket: webSocket ] ]
				on: ConnectionClosed
				do: [ self freeResourcesFor: webSocket ] ]
				on: PrimitiveFailed
				do: [ self class restart ] ]
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate >> messageOnError [
	^ 'An error has occured. Please Reload the page. If the problem persists, contact support.'
]

{ #category : #'as yet unclassified' }
TLCytoscapeWebSocketDelegate >> onMessageReceived: message webSocket: aWebSocket [
	"On message received, we transform the Json string to dictionary; then create clients commands and execute those"

	| visusToUpdate |
	visusToUpdate := Set new.	"Execute clients commands on server"
	(NeoJSONReader fromString: message)
		do: [ :aCommandDictionary | 
			"register the visu"
			[ 
			[ 
			self associateSocket: aWebSocket toVisuId: (aCommandDictionary at: #id).	"then execute command"
			(TLVisualizationClientsCommand createFrom: aCommandDictionary)
				executeOnVisu: (self visualizationByIdDictionary at: (aCommandDictionary at: #id)) ]
				on: TLNothingToDoException
				do: [ :e | TLSendMessageOnErrorCommand new: (aCommandDictionary at: #id) withError: e on: aWebSocket ] ]
				on: Error
				do: [ :e | 
					self class development
						ifFalse: [ TLErrorCommand new: (aCommandDictionary at: #id) withError: e on: aWebSocket ]
						ifTrue: [ e pass ] ] ]
]

{ #category : #'as yet unclassified' }
TLCytoscapeWebSocketDelegate >> registerVisualization: aTLVisualization underId: aDivId withCallBack: aCallBack callbackUrl: callbackUrl [
	aTLVisualization generator visuId: aDivId.
	aTLVisualization generator visuCallBack: aCallBack.
	aTLVisualization generator visuCallBackUrl: callbackUrl.
	self visualizationByIdDictionary at: aDivId put: aTLVisualization
]

{ #category : #'as yet unclassified' }
TLCytoscapeWebSocketDelegate >> sendCommands: aCollectionOfCommands forVisu: aTLVisualization [
	[ 
	aCollectionOfCommands
		ifEmpty: [ self sendNothingToDoForVisu: aTLVisualization ]
		ifNotEmpty: [ (self webSocketForVisu: aTLVisualization) sendMessage: (NeoJSONWriter toString: aCollectionOfCommands) ] ]
		on: ConnectionTimedOut
		do: [ 
			"The client leave the page before datas where sent"
			 ]
]

{ #category : #'as yet unclassified' }
TLCytoscapeWebSocketDelegate >> sendNothingToDoForVisu: aTLVisualization [
	(self webSocketForVisu: aTLVisualization)
		sendMessage:
			(NeoJSONWriter
				toString:
					(TLSendMessageOnErrorCommand
						new: aTLVisualization visuId
						withError: (TLNothingToDoException new messageText: 'Nothing to do')
						on: (self webSocketForVisu: aTLVisualization)))
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate >> visualizationByIdDictionary [
	^ visualizationByIdDictionary
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate >> visualizationByIdDictionary: anObject [
	visualizationByIdDictionary := anObject
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate >> visualizationWithId: aDivId [
	^ visualizationByIdDictionary at: aDivId
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate >> webSocketForVisu: aTLVisualization [
	^ self websocketByVisu at: aTLVisualization
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate >> websocketByVisu [
	^ websocketByVisu
]

{ #category : #accessing }
TLCytoscapeWebSocketDelegate >> websocketByVisu: anObject [
	websocketByVisu := anObject
]
