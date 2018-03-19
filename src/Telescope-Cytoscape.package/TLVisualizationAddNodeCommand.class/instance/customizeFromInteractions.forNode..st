as yet unclassified
customizeFromInteractions: aCollectionOfInteractions forNode: aTLNode
	self
		mouseOverInteraction:
			(aCollectionOfInteractions
				anySatisfy: [ :interaction | interaction action isPopUp not and: [ interaction shouldOccursOn: 'mouseOver' with: aTLNode ] ]).
	self dropInteraction: (aCollectionOfInteractions anySatisfy: #isDrop).
	self
		popUp:
			(aCollectionOfInteractions
				detect: [ :interaction | interaction action isPopUp and: [interaction condition value: aTLNode] ]
				ifFound: [ :interaction | 
					[ interaction forCytoscapeFromNode: aTLNode ]
						on: TLNilOrEmptyTextException
						do: [ nil ] ]
				ifNone: [ nil ]).
	self
		menu:
			(aCollectionOfInteractions
				select: [ :interaction | interaction shouldOccursOn: #menu with: aTLNode ]
				thenCollect: [ :anInteraction | 
					| dic |
					dic := Dictionary new.
					dic at: 'title' put: anInteraction title.
					anInteraction isMultiChoiceMenu
						ifTrue: [ dic at: #subMenu put: ((anInteraction choicesListForDrawable: aTLNode) collect: anInteraction displayBlock) ].
					dic ])