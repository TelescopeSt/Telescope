generation
generate
	| result |
	"Do not override this method"
	result :=  self generateWith: self generator.
	self updateDone.
	self layoutApplicationDone.
	^ result