iterating
sourceSelect: aBlockClosure
	| selection |
	selection := TLDrawableCollection new.
	self from: self rootSource select: (self addStrategiesToBlock: aBlockClosure) into: selection.
	^ selection