building
buildVisualization
	| objects minOcc maxOcc |
	objects := self sortedSymbolsToDisplay.
	minOcc := (objects collect: #value) min.
	maxOcc := (objects collect: #value) max.
	"The background and border color here are hacks because CYtoscape does not manage the TLNoShape shape for now."
	(self > #names) styleSheet
		"onlyLabelForNodes;"
		nodeLabel: #key;
		backgroundColor: Color transparent;
		borderColor: Color transparent;
		adaptNodeWidthFromLabel;
		labelSize: [ :each | self relativeSizeOf: each value withMin: minOcc andMax: maxOcc ].
	(self > #names)
		addNodesFromEntities: objects;
		addInteraction: (TLPopUpAction text: [ :each | each value asString, ' occurences.' ]) onMouseOver;
		layout: (TLLinearLayout ratio: 16/9)