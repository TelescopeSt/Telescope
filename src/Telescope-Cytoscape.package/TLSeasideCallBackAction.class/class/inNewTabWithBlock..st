instance-creation
inNewTabWithBlock: aBlockClosure
	^ self new
		block: aBlockClosure;
		openInNewTab: true;
		yourself