accessing
visualization: anObject
	visualization := anObject.
	connector := TLCytoscapeConnector new.
	visualization generator: connector