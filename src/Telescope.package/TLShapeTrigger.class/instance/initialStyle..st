as yet unclassified
initialStyle: aStyleOrStyleSheetCustomizationBlock
	aStyleOrStyleSheetCustomizationBlock isSymbol
		ifTrue: [ self addStyle: aStyleOrStyleSheetCustomizationBlock ]
		ifFalse: [ aStyleOrStyleSheetCustomizationBlock value: self styleSheet ]