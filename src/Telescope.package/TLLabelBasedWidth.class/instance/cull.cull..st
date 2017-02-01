evaluating
cull: anEntity cull: aNode
	
	| stringLabel |
	stringLabel := aNode effectiveStyleSheet nodeLabel cull: anEntity cull: aNode.
	^ stringLabel isEmptyOrNil
		ifFalse: [ 2 + (stringLabel size * 10) ]
		ifTrue: [ self defaultWidth ifNil: [ TLStyleSheetLabelBasedWidthBadlyUsed signalForEntity: anEntity ] ] 
		