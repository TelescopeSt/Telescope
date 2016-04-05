as yet unclassified
registerVisualization: aTLVisualization underId: aDivId withCallBack: aCallBack callbackUrl: callbackUrl
	aTLVisualization generator visuId: aDivId.
	aTLVisualization generator visuCallBack: aCallBack.
	aTLVisualization generator visuCallBackUrl: callbackUrl.
	self visualizationByIdDictionary at: aDivId put: aTLVisualization