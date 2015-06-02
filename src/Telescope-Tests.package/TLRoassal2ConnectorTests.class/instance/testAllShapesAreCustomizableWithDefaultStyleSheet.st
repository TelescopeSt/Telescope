as yet unclassified
testAllShapesAreCustomizableWithDefaultStyleSheet
	TLSimpleShape allSubclasses
		do: [ :aSubclass | 
			| shape |
			shape := connector generateShapeCorrespondingTo: aSubclass.
			connector customizeShape: shape withStyleSheet: TLStyleSheet default ]