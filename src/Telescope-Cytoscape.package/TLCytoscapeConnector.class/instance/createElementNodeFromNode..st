generation - node
createElementNodeFromNode: aNode
	| styleSheet nodeId |
	nodeId := self generateDrawableId.
	styleSheet := aNode effectiveStyleSheet.
	self addCommand:  (TLVisualizationAddNodeCommand new
		nodeId: nodeId;
		visuId: visuId;
		style:
				(self
						createStyleDictionaryWith:
							#(#borderColor #borderWidth #width #height #backgroundColor  #textColor) styleSheet: styleSheet entity: aNode entity)).
	"#nodeLabel #nodeLabelPosition"
	^ nodeId	"we return the nodeId that will be the only things we will retain in addition of Node"