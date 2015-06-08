as yet unclassified
initialStyle: aStyleOrStyleSheetCustomizationBlock
	aStyleOrStyleSheetCustomizationBlock isSymbol
		ifTrue: [ self addStyle: aStyleOrStyleSheetCustomizationBlock ] 
		ifFalse: [ self styleSheet dynamicCustomization: aStyleOrStyleSheetCustomizationBlock ]