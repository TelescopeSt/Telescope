action
removeCustomization: aTLDrawable
	[aTLDrawable styleSheet: (aTLDrawable state removeKey: self stateKey)] on: KeyNotFound do: [ Transcript show: 'Problem: #removeCustomization find no key' ] .
	aTLDrawable requireUpdate.