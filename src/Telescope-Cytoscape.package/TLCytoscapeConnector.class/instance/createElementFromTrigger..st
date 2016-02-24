generation - interaction
createElementFromTrigger: aTrigger
	| styleSheet nodeId virtualTrigger virtualNodeReference |
	nodeId := self generateDrawableId.
	virtualNodeReference := self elementFromTLDrawable: aTrigger referencedElement.
	styleSheet := aTrigger effectiveStyleSheet.
	virtualTrigger := TLVirtualNode new
		nodeId: nodeId;
		realNode: aTrigger;
		dimension: (styleSheet obtainValue: #width forEntity: nil) @ (styleSheet obtainValue: #height forEntity: nil);
		position: [ styleSheet triggerPosition computePositionOf: virtualTrigger relativeTo: virtualNodeReference ];
		yourself.
	self
		addCommand:
			(TLVisualizationAddTriggerCommand new
				mouseOverInteraction: (aTrigger allInteractions anySatisfy: #isMouseOver);
				visuId: self visuId;
				style: (styleSheet cytoscapeNodeStyleFor: aTrigger referencedElement);
				virtualNodeReference: virtualNodeReference;
				virtualTrigger: virtualTrigger;
				yourself).
	^ virtualTrigger