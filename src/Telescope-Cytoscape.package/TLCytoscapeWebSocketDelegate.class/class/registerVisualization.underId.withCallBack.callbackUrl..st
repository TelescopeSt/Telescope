registration
registerVisualization: aTLVisualization underId: aDivId withCallBack: aCallBack callbackUrl: callbackUrl
	self ensureServerIsRunning.
	self singleton delegate
		registerVisualization: aTLVisualization
		underId: aDivId
		withCallBack: aCallBack
		callbackUrl: callbackUrl