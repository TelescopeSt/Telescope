as yet unclassified
initialize
	super initialize.
	self handler: [ :webSocket | webSocket runWith: [:message | message inspect] ]