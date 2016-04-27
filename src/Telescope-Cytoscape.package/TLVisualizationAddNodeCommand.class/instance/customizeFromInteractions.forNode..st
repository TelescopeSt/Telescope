as yet unclassified
customizeFromInteractions: aCollectionOfInteractions forNode: aTLNode
	self
		mouseOverInteraction:
			(aCollectionOfInteractions
				anySatisfy: [ :interaction | interaction action isPopUp not and: [ interaction isMouseOver ] ]).
	self
		popUp:
			(aCollectionOfInteractions
				detect: [ :interaction | interaction action isPopUp ]
				ifFound: [ :interaction | interaction forCytoscapeFromNode: aTLNode ]
				ifNone: [ nil ]).
	self menu: (aCollectionOfInteractions select: #isMenu thenCollect: #title)