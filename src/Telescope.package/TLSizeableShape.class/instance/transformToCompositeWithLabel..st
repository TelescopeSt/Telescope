as yet unclassified
transformToCompositeWithLabel: aString
	| newShape |
	newShape := TLCompositeLabelShape new.
	newShape shape: self.
	newShape label text: aString.
	^ newShape