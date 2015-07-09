action
actionOn: aTLDrawable
	[ aTLDrawable moveToGroup: (movedConnectableDictionary removeKey: aTLDrawable) ]
		on: KeyNotFound
		do: [ 
			movedConnectableDictionary at: aTLDrawable put: aTLDrawable parent.
			aTLDrawable moveToGroup: self destinationGroup ]