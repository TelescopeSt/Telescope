evaluating
cull: anEntity cull: aNode
	^ [ 2 + ((aNode effectiveStyleSheet nodeLabel cull: anEntity cull: aNode) size * 10) ]
		on: MessageNotUnderstood
		do: [ self defaultWidth ifNil: [ TLStyleSheetLabelBasedWidthBadlyUsed signalForEntity: anEntity ] ]