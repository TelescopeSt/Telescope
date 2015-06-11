generation
isVisible
	^ (super isVisible and: [  self fromNode isVisible]) and: [ self toNode isVisible ]