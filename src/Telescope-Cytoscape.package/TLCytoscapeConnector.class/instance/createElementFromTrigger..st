generation - interaction
createElementFromTrigger: aTrigger
	| styleSheet nodeId virtualTrigger virtualNodeReference |
	nodeId := self generateDrawableId.
	virtualNodeReference := self elementFromTLDrawable: aTrigger referencedElement.
	styleSheet := aTrigger effectiveStyleSheet.
	self flag: #TODO. "Check if we should provide aTrigger in #obtainValue"
	virtualTrigger := TLVirtualNode new
		nodeId: nodeId;
		realNode: aTrigger;
		dimension:
				(styleSheet obtainValue: #width forEntity: nil inNode: aTrigger)
						@ (styleSheet obtainValue: #height forEntity: nil inNode: aTrigger);
		position: [ styleSheet triggerPosition computePositionOf: virtualTrigger relativeTo: virtualNodeReference ];
		yourself.
	self flag: #TODO. "virtualTrigger is uninitialized at this point, BUG?"
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