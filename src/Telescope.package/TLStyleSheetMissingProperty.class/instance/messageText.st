accessing
messageText
	^ 'Telescope encountered an error because the property : ' , self property asString , ' is missing for entity: '
		, self entity asString