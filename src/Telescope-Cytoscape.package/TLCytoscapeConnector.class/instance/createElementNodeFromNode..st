generation - node
createElementNodeFromNode: aNode
	| styleSheet nodeId |
	nodeId := self generateDrawableId.
	styleSheet := aNode effectiveStyleSheet.
	self addCommand:  (TLVisualizationAddNodeCommand new
		nodeId: nodeId;
		style:
				(self
						createStyleDictionaryWith:
							#(#borderColor #borderWidth #width #height #backgroundColor #nodeLabel #nodeLabelPosition #textColor) styleSheet: styleSheet entity: aNode entity)).
	^ nodeId	"we return the nodeId that will be the only things we will retain in addition of Node"