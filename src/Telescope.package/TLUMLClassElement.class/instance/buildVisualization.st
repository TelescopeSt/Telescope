building
buildVisualization
	"general layout for class and its elements"

	(self
		childrenProperty: [ :aClass | 
			{aClass.
			aClass} ]) childrenProperty: #yourself.
	self styleSheet
		childrenLayout: (TLLinearLayout topToBottom gap: 0);
		compositeExpandedByDefault: true;
		backgroundColor: Color white;
		borderColor: Color black;
		nodeLabel: #name position: #inside.	"for variables and methods groups"
	(self styleSheet > #children)
		borderColor: Color white;
		noNodeLabel.	"for variables and methods separately"
	(self styleSheet > #children > #children)
		nodeLabel: #name;
		onlyLabelForNodes.
	self > #default addNodeFromEntity: self entity.
	self > #default
		nodesDo: [ :aClassNode | 
			aClassNode childrenNodes first childrenProperty: self attributesBlock.
			aClassNode childrenNodes second childrenProperty: self methodsBlock ]