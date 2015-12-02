generation - node
createElementNodeFromNode: aNode
	| styleSheet |
	styleSheet := aNode effectiveStyleSheet.
	^ TLVisualizationAddNodeCommand new
		nodeId: self generateDrawableId;
		style:
				(self
						createStyleDictionaryWith:
							#(#borderColor #borderWidth #width #height #backGroundColor #nodeLabel #nodeLabelPosition #textColor) styleSheet: styleSheet entity: aNode entity);
		nodeId	"we return the nodeId that will be the only things we will retain in addition of Node"