action
removeCustomization: aDrawable
	[ 
		aDrawable styleSheet: (aDrawable state removeKey: self stateKey).
		aDrawable requireUpdate.
	
		"In case we have a composite node that opened, we also need to refresh its children."
		(aDrawable isCompositeNode and: [ aDrawable hasChildrenToDisplay ]) ifTrue: [ aDrawable childrenNodes do: #requireUpdate ]
	 ]
		on: KeyNotFound
		do: [ self flag: 'Trying to remove a customization that I do not have in my style dict' ]