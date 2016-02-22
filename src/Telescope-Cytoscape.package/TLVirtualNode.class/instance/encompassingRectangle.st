accessing
encompassingRectangle
	^ encompassingRectangle ifNil: [ encompassingRectangle := Rectangle center: self position extent: self dimension ]