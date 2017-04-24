evaluating
cull: anEntity cull: aNode
	| stringLabel |
	stringLabel := aNode effectiveStyleSheet obtainValue: #nodeLabel forEntity: anEntity inNode: aNode.
	^ stringLabel isEmptyOrNil
		ifFalse: [ | labelSize |
			labelSize := aNode effectiveStyleSheet obtainValue: #labelSize forEntity: anEntity inNode: aNode.
			(2 + (stringLabel size * 10)) / (TLStyleSheet defaultLabelSize / labelSize) ]
		ifTrue: [ self defaultWidth ifNil: [ TLStyleSheetLabelBasedWidthBadlyUsed signalForEntity: anEntity ] ]