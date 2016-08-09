updating - node
updateElementNodeOf: aDrawable
	| element |
	element := self elementFromTLDrawable: aDrawable.
	aDrawable hierarchyChanged
		ifTrue: [ 
			self
				addCommand:
					(TLVisualizationRemoveElementCommand new
						visuId: self visuId;
						nodeId: element nodeId;
						yourself).
			self
				addCommand:
					(TLVisualizationAddNodeCommand new
						virtualNode: element;
						customizeFromInteractions: aDrawable allInteractions forNode: aDrawable;
						visuId: self visuId;
						style: (aDrawable effectiveStyleSheet cytoscapeNodeStyleFor: aDrawable)) ]
		ifFalse: [ 
			self
				addCommand:
					(TLVisualizationCustomizeElementCommand new
						virtualNode: element;
						mouseOverInteraction: (aDrawable allInteractions anySatisfy: #isMouseOver);
						visuId: self visuId;
						style: (aDrawable effectiveStyleSheet cytoscapeNodeStyleFor: aDrawable)) ]