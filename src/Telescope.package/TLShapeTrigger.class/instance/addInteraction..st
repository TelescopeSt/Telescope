as yet unclassified
addInteraction: aTLInteraction
	self assert: aTLInteraction action = self action description: 'A trigger cannot have other action than the default one'.
	super addInteraction: aTLInteraction