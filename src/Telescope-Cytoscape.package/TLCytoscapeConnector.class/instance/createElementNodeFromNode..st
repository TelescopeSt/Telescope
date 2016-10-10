generation - node
createElementNodeFromNode: aNode
	| styleSheet nodeId virtualNode |
	nodeId := self generateDrawableId.
	styleSheet := aNode effectiveStyleSheet.
	virtualNode := TLVirtualNode new
		nodeId: nodeId;
		realNode: aNode;
		dimension:
				(styleSheet obtainValue: #width forEntity: aNode entity inNode: aNode)
						@ (styleSheet obtainValue: #height forEntity: aNode entity inNode: aNode);
		position: 0 @ 0;
		yourself.	"temp  position for creation"
	self tryToFixPositionFor: virtualNode styleSheet: styleSheet node: aNode.
	self
		addCommand:
			(TLVisualizationAddNodeCommand new
				virtualNode: virtualNode;
				customizeFromInteractions: aNode allInteractions forNode: aNode;
				visuId: self visuId;
				style: (styleSheet cytoscapeNodeStyleFor: aNode)).
	^ virtualNode