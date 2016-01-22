as yet unclassified
testAllShapesAreGenerable
	TLSimpleShape allSubclasses
		do: [ :aSubclass | self deny: (connector generateShapeCorrespondingTo: aSubclass) isClass ]