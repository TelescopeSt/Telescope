transformation
becomeComposite
	| composite index |
	composite := TLCompositeNode new.
	index := self class instSize.
	[ index > 0 ]
		whileTrue: [ 
			composite instVarAt: index put: (self instVarAt: index).
			index := index - 1 ].
	composite addStyle: composite defaultStyle.
	composite state at: #childrenExpanded put: nil.
	self become: composite