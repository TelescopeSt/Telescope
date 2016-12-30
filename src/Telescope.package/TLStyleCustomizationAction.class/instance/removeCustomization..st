action
removeCustomization: aDrawable
[	aDrawable styleSheet: (aDrawable state removeKey: self stateKey).
	aDrawable requireUpdate] on: KeyNotFound do: [ self flag: 'Trying to remove a customization that I do not have in my style dict' ]