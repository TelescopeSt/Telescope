as yet unclassified
shape: aShape label: aLabel
	^ self new
		shape: aShape;
		labelShape:
				(RTLabel new
						text: aLabel;
						yourself);
		yourself