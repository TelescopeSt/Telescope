iterating
sourceSelect: aSelectionBlock thenDo: aDoBlock
	| selection |
	selection := TLDrawableCollection new.
	self from: self rootSource select: (self addStrategiesToBlock: aSelectionBlock) thenDo: aDoBlock.
	^ selection