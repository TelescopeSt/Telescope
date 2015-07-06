instance creation
openViewInWindowSized: aSize titled: aTitle
	| window |
	window := self view openInWindowSized: aSize titled: aTitle.
	window menuPragmaNamed: 'telescopeMenu' model: self.
	self viewMorph: window
	"self view canvas camera focusOnCenterScaled.
	self view canvas camera focusOnCenter"