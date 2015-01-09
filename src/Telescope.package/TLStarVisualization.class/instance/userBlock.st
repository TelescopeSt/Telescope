accessing
userBlock
	^ userBlock ifNil: [userBlock := [:aNode | ]. userBlock ]