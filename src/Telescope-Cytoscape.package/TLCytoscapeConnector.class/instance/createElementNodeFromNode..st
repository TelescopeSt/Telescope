generation - node
createElementNodeFromNode: aNode
	| styleSheet nodeId virtualNode |
	nodeId := self generateDrawableId.
	styleSheet := aNode effectiveStyleSheet.
	virtualNode := TLVirtualNode new
		nodeId: nodeId;
		dimension: (styleSheet width)@(styleSheet height);
		yourself.
	self
		addCommand:
			(TLVisualizationAddNodeCommand new
				virtualNode: virtualNode;
				visuId: visuId;
				style:
						(self
								createStyleDictionaryWith: #(#borderColor #borderWidth #width #height #backgroundColor #textColor)
								styleSheet: styleSheet
								entity: aNode entity)).	"#nodeLabel #nodeLabelPosition"
	^ virtualNode