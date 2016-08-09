initialization
clear
	self removingCustomizingCommands: OrderedCollection new.
	self addingCommand: TLVisualizationMultiAddingCommand new.
	self positionNodesCommand: TLVisualizationPositionNodesCommand new.
	self visuId ifNotNil: [ self visuId: self visuId ]