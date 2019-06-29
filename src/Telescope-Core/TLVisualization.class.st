"
A TLVisualization is the superclass for all Telescope Visualization.

A visualization is a group of drawables able to open and display its content.

Instance Variables
	connections:		<Object>
	title:		<Object>

connections
	- xxxxx

title
	- xxxxx

"
Class {
	#name : #TLVisualization,
	#superclass : #TLEntitiesGroup,
	#instVars : [
		'title',
		'legend',
		'openingDimension',
		'shouldReplaceCameraWhenUpdating'
	],
	#category : #'Telescope-Core-Model'
}

{ #category : #'instance creation' }
TLVisualization class >> fromEntities: aCollection [
	^ self new
		addNodesFromEntities: aCollection;
		yourself
]

{ #category : #building }
TLVisualization >> buildLegend [
]

{ #category : #building }
TLVisualization >> buildVisualization [
	self buildLegend 
]

{ #category : #building }
TLVisualization >> buildVisualizationOn: aView [
	self generator view: aView.
	self generate
]

{ #category : #'instance creation' }
TLVisualization >> close [
	self generator closeVisualization
]

{ #category : #layout }
TLVisualization >> configLayout [
	
]

{ #category : #style }
TLVisualization >> defaultBackgroundColor [
	^ MDLColor orange lighter alpha:0.6
]

{ #category : #default }
TLVisualization >> defaultConnector [
	^ TLConnector default new
]

{ #category : #style }
TLVisualization >> defaultStyle [
	^ #visualization
]

{ #category : #default }
TLVisualization >> defaultTitle [
	^ ''
]

{ #category : #accessing }
TLVisualization >> fullScreenOpening [
	self openingDimension: World fullBounds
]

{ #category : #'private-connector' }
TLVisualization >> generateWith: aTLConnector [
	| generated |
	self buildVisualization.
	generated := aTLConnector generateVisualization: self.
	self hierarchyChangeManaged.
	self hasBeenGenerated: true.
	^ generated
]

{ #category : #accessing }
TLVisualization >> generator [
	generator ifNil: [ self generator: self defaultConnector ].
	^ generator
]

{ #category : #'private-connector' }
TLVisualization >> hasBeenGenerated [
	^ self state at: #hasBeenGenerated ifAbsentPut: [ false ]
]

{ #category : #'private-connector' }
TLVisualization >> hasBeenGenerated: aBoolean [
	^ self state at: #hasBeenGenerated put: aBoolean
]

{ #category : #initialization }
TLVisualization >> initialize [
	super initialize.
	self styleSheet: TLStyleSheet default.
	self nodeCreationStrategy: TLNodeCreationStrategy default.
	self openingDimension: 720@480.
	self legend: (TLLegend parent: self).
	shouldReplaceCameraWhenUpdating := false.
	self configLayout
]

{ #category : #testing }
TLVisualization >> isVisualization [
	^ true
]

{ #category : #accessing }
TLVisualization >> leafs [
	^ self telescopeEntities flatCollect: #leafs
]

{ #category : #accessing }
TLVisualization >> legend [
	^ legend
]

{ #category : #accessing }
TLVisualization >> legend: aTLLegend [
	legend := aTLLegend.
	aTLLegend parent: self
]

{ #category : #'instance creation' }
TLVisualization >> open [
	[ self generator open: self inWindowSized: self openingDimension titled: self title ]
		on: TLNoConnectorException
		do: [ UIManager default
				alert:
					'Telescope is an engine for efficiently creating meaningful visualizations but Telescope is not a project to render visualizations by itself. 
			
Telescope allows one to create a model of visualization and then to render them via a connector to a visualization framework.
You are currently missing a connector to render the visualization. You can find more informations at: https://github.com/TelescopeSt/Telescope'
				title: 'No connector present in the image' ]
]

{ #category : #accessing }
TLVisualization >> openingDimension [
	^ openingDimension
]

{ #category : #accessing }
TLVisualization >> openingDimension: anObject [
	openingDimension := anObject
]

{ #category : #camera }
TLVisualization >> replaceCameraWhenUpdating [
	shouldReplaceCameraWhenUpdating := true
]

{ #category : #state }
TLVisualization >> requireUpdate [
	super requireUpdate.
	self legend ifNotNil: [ :aLegend | aLegend requireUpdate ]
]

{ #category : #camera }
TLVisualization >> shouldReplaceCameraWhenUpdating [
	^ shouldReplaceCameraWhenUpdating
]

{ #category : #accessing }
TLVisualization >> title [
	title ifNil: [ self title: ('Telescope ', self defaultTitle, ' Visualization') ].
	^ title
]

{ #category : #accessing }
TLVisualization >> title: anObject [
	title := anObject
]

{ #category : #'private-connector' }
TLVisualization >> updateWith: aTLGenerator [
	aTLGenerator updateVisualization: self
]

{ #category : #accessing }
TLVisualization >> visualization [
	^ self
]

{ #category : #dimension }
TLVisualization >> visualizationDimension [
	^ 1200 @ 720
]
