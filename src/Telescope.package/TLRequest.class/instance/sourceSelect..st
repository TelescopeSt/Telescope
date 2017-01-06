iterating
sourceSelect: aBlockClosure
	| selection |
	selection := TLDrawableCollection new.
	self from: self rootSource select: aBlockClosure into: selection.
	^ selection