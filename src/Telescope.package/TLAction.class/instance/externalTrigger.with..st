testing
externalTrigger: anElementHTML with: html
	anElementHTML onClick: ((html jQuery ajax)
		callback: '')