"
A TLStyleSheet is a styleSheet specialized for telescope.

"
Class {
	#name : #TLStyleSheet,
	#superclass : #StyleSheet,
	#category : #'Telescope-Core-Style'
}

{ #category : #'initialize-release' }
TLStyleSheet class >> default [
	| defaultStyleSheet |
	defaultStyleSheet := self new
		layout: (TLLinearLayout gap: 15 maximumDimension: 300);
		backgroundColor: (Color orange lighter alpha: 0.5);
		borderColor: Color black;
		textColor: Color black;
		borderWidth: 1;
		width: 15;
		height: 15;
		shape: TLRectangle;
		nodeLabelPosition: #inside;
		compositeExpandedByDefault: false;
		childrenLayout: (TLLinearLayout gap: 5 maximumDimension: 50);
		takeAllSpace: false;
		triggerPosition: #right;
		labelSize: self defaultLabelSize;
		yourself.
	(defaultStyleSheet > #shapeInteraction)
		backgroundColor: Color lightBlue;
		shape: TLEllipse;
		noNodeLabel;
		width: 8;
		height: 8.
	(defaultStyleSheet > #connection)
		color: Color gray;
		curveStyle: TLBezierCurve;
		width: 1.
	defaultStyleSheet > #connection > #head shape: TLTriangle.
	^ defaultStyleSheet
]

{ #category : #'initialize-release' }
TLStyleSheet class >> defaultLabelSize [
	^ 14
]

{ #category : #shape }
TLStyleSheet >> adaptNodeWidthFromLabel [
	self width: TLLabelBasedWidth new
]

{ #category : #shape }
TLStyleSheet >> adaptNodeWidthFromLabelWithDefault: aNumber [
	self width: (TLLabelBasedWidth defaultWidth: aNumber)
]

{ #category : #shape }
TLStyleSheet >> backgroundColor [
	^ self get: #backGroundColor
]

{ #category : #shape }
TLStyleSheet >> backgroundColor: aColor [ 
	self at: #backGroundColor put: aColor
]

{ #category : #children }
TLStyleSheet >> beChildrenRecursive [
	"Be careful by combining this with #compositeExpandedByDefault because it can creates infinite loops"
	self substyles at: #children put: self.
]

{ #category : #shape }
TLStyleSheet >> borderColor [
	^ self get: #borderColor
]

{ #category : #shape }
TLStyleSheet >> borderColor: aColor [ 
	self at: #borderColor put: aColor
]

{ #category : #shape }
TLStyleSheet >> borderStyle [
	^ self get: #borderStyle
]

{ #category : #shape }
TLStyleSheet >> borderStyle: aLineStyle [
	self at: #borderStyle put: aLineStyle
]

{ #category : #shape }
TLStyleSheet >> borderWidth [
	^ self get: #borderWidth
]

{ #category : #shape }
TLStyleSheet >> borderWidth: aWidth [
	self at: #borderWidth put: aWidth
]

{ #category : #children }
TLStyleSheet >> childrenLayout [
	^ (self > #children) layout
]

{ #category : #children }
TLStyleSheet >> childrenLayout: aLayout [
	(self > #children) layout: aLayout
]

{ #category : #connection }
TLStyleSheet >> color [
	^ self get: #color
]

{ #category : #connection }
TLStyleSheet >> color: aValuableOrColor [
	^ self at: #color put: aValuableOrColor
]

{ #category : #children }
TLStyleSheet >> compositeExpandedByDefault [
	^ self get: #compositeExpandedByDefault
]

{ #category : #children }
TLStyleSheet >> compositeExpandedByDefault: aBoolean [
	self at: #compositeExpandedByDefault put: aBoolean
]

{ #category : #connection }
TLStyleSheet >> connectionLabel [
	^ self get: #connectionLabel
]

{ #category : #connection }
TLStyleSheet >> connectionLabel: aValuableOrText [
	^ self at: #connectionLabel put: aValuableOrText
]

{ #category : #connection }
TLStyleSheet >> connectionLabelSize [
	^ self get: #connectionLabelSize
]

{ #category : #connection }
TLStyleSheet >> connectionLabelSize: aValuableOrInteger [
	^ self at: #connectionLabelSize put: aValuableOrInteger
]

{ #category : #connection }
TLStyleSheet >> connectionLineStyle [
	^ self get: #connectionLineStyle
]

{ #category : #connection }
TLStyleSheet >> connectionLineStyle: aLineStyle [
	^ self at: #connectionLineStyle put: aLineStyle
]

{ #category : #connection }
TLStyleSheet >> connectionStyle [
	^ self get: #connectionStyle
]

{ #category : #connection }
TLStyleSheet >> connectionStyle: aConnectionStyle [
	^ self at: #connectionStyle put: aConnectionStyle
]

{ #category : #connection }
TLStyleSheet >> curveStyle [
	^ self get: #curveStyle
]

{ #category : #connection }
TLStyleSheet >> curveStyle: aCurveStyle [
	^ self at: #curveStyle put: aCurveStyle
]

{ #category : #children }
TLStyleSheet >> expandCompositeNodes [
	self compositeExpandedByDefault: true
]

{ #category : #shape }
TLStyleSheet >> fontSize [
	^ self get: #fontSize
]

{ #category : #shape }
TLStyleSheet >> fontSize: aSize [
	self at: #fontSize put: aSize 
]

{ #category : #private }
TLStyleSheet >> get: aProperty [
	^ [ super get: aProperty ]
		on: KeyNotFound
		do: [ TLStyleSheetMissingProperty new
				property: aProperty;
				signal ]
]

{ #category : #shape }
TLStyleSheet >> height [
	^ self get: #height
]

{ #category : #shape }
TLStyleSheet >> height: aHeight [
	self at: #height put: aHeight 
]

{ #category : #testing }
TLStyleSheet >> includesAnySubstyles: aCollectionOfSubstyles [
	self > #children.
	^ super includesAnySubstyles: aCollectionOfSubstyles
]

{ #category : #label }
TLStyleSheet >> labelSize [
	^ self get: #labelSize
]

{ #category : #label }
TLStyleSheet >> labelSize: anIntegerValuable [
	self at: #labelSize put: anIntegerValuable
]

{ #category : #layout }
TLStyleSheet >> layout [
	^ self get: #layout
]

{ #category : #layout }
TLStyleSheet >> layout: aLayout [
	self at: #layout put: aLayout
]

{ #category : #label }
TLStyleSheet >> noNodeLabel [

	self nodeLabel: TLNoNodeLabel
]

{ #category : #label }
TLStyleSheet >> nodeLabel [
	^ self get: #nodeLabel
]

{ #category : #label }
TLStyleSheet >> nodeLabel: aNodeLabelValuable [
	self at: #nodeLabel put: aNodeLabelValuable
]

{ #category : #label }
TLStyleSheet >> nodeLabel: aNodeLabel position: aNodeLabelPosition [
	self nodeLabel: aNodeLabel; nodeLabelPosition: aNodeLabelPosition 
]

{ #category : #label }
TLStyleSheet >> nodeLabelMaxWidth [
	^ self get: #nodeLabelMaxWidth
]

{ #category : #label }
TLStyleSheet >> nodeLabelMaxWidth: anInteger [
	"Can be 'none', 'wrap' or 'ellipsis'. Note that 'ellipsis' needs to be used with #nodeLabelMaxWidth"

	self at: #nodeLabelMaxWidth put: anInteger
]

{ #category : #label }
TLStyleSheet >> nodeLabelPosition [
	^ self get: #nodeLabelPosition
]

{ #category : #label }
TLStyleSheet >> nodeLabelPosition: aNodeLabelPosition [
	self
		at: #nodeLabelPosition
		put:
			(aNodeLabelPosition isBlock
				ifTrue: [ aNodeLabelPosition ]
				ifFalse: [ TLPosition for: aNodeLabelPosition ])
]

{ #category : #label }
TLStyleSheet >> nodeLabelWrap [
	^ self get: #nodeLabelWrap
]

{ #category : #label }
TLStyleSheet >> nodeLabelWrap: aString [
	"Can be 'none', 'wrap' or 'ellipsis'. Note that 'ellipsis' needs to be used with #nodeLabelMaxWidth"
	
	self at: #nodeLabelWrap put: aString
]

{ #category : #private }
TLStyleSheet >> obtainValue: aPropertyOrValuable forEntity: anEntity inNode: aNode [
	| result |
	[ result := aPropertyOrValuable cull: self ]
		on: KeyNotFound
		do: [ :msg | 
			TLStyleSheetMissingProperty new
				property: aPropertyOrValuable;
				entity: anEntity;
				signal ].
	^ result isEvaluable
		ifTrue: [ 
			[ result cull: anEntity cull: aNode ]
				on: MessageNotUnderstood
				do: [ TLStyleSheetPropertyBadlyUsed signalForProperty: aPropertyOrValuable propertyBlock: result entity: anEntity ] ]
		ifFalse: [ result ]
]

{ #category : #shape }
TLStyleSheet >> occupyMaximumSpace [
	^ self takeAllSpace: true
]

{ #category : #shape }
TLStyleSheet >> onlyLabelForNodes [
	self shape: TLNoShape
]

{ #category : #layout }
TLStyleSheet >> position [
	^ self get: #position
]

{ #category : #layout }
TLStyleSheet >> position: aPosition [
	"The relative to its parent position of a node; if you fill it, the layout will not place the node"

	self at: #position put: aPosition
]

{ #category : #shape }
TLStyleSheet >> shape [
	^ self get: #shape
]

{ #category : #shape }
TLStyleSheet >> shape: aShape [
	"self assert: (aShape inheritsFrom: TLSimpleShape) description: 'You must provide a subclass of TLSimpleShape'.
	"self at: #shape put: aShape
]

{ #category : #composite }
TLStyleSheet >> showChildrenConnectionsOnParent [
	self shouldBeImplemented.
]

{ #category : #shape }
TLStyleSheet >> takeAllSpace [
	^ self get: #takeAllSpace
]

{ #category : #shape }
TLStyleSheet >> takeAllSpace: aBoolean [
	self at: #takeAllSpace put: aBoolean
]

{ #category : #label }
TLStyleSheet >> textColor [
	^ self get: #textColor
]

{ #category : #label }
TLStyleSheet >> textColor: aColor [
	self at: #textColor put: aColor
]

{ #category : #interaction }
TLStyleSheet >> triggerPosition [
	^ self get: #triggerPosition
]

{ #category : #interaction }
TLStyleSheet >> triggerPosition: aTriggerPosition [
	self at: #triggerPosition put: (TLPosition for: aTriggerPosition)
]

{ #category : #shape }
TLStyleSheet >> width [
	^ self get: #width
]

{ #category : #shape }
TLStyleSheet >> width: aWidth [
	self at: #width put: aWidth
]
