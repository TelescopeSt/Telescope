generation - node
createElementNodeFromNode: aNode
	| styleSheet nodeId virtualNode |
	nodeId := self generateDrawableId.
	styleSheet := aNode effectiveStyleSheet.
	virtualNode := TLVirtualNode new
		nodeId: nodeId;
		realNode: aNode;
		dimension: (styleSheet obtainValue: #width forEntity: aNode entity)@(styleSheet obtainValue: #height forEntity: aNode entity);
		position: (0@0 atRandom)
		yourself.
	"temp  position for creation".
	self
		addCommand:
			(TLVisualizationAddNodeCommand new
				virtualNode: virtualNode;
				mouseOverInteraction: (aNode allInteractions anySatisfy: #isMouseOver);
		
				visuId: self visuId;
				style:
						(styleSheet cytoscapeNodeStyleFor: aNode)).
								
	^ virtualNode