starting/stopping
ensureServerIsRunning
	self singleton ifNil: [ self run ]