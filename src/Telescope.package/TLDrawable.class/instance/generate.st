generation
generate
	| result |
	result :=  self generateWith: self generator.
	self updateDone.
	self layoutApplicationDone.
	^ result