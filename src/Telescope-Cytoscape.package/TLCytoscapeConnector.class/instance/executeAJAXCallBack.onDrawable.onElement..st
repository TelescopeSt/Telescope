callback
executeAJAXCallBack: callbackURL onDrawable: aDrawable  onElement: aCssSelector
		"ask the client to execute it"
	self
		addCommand:
			(TLVisualizationAJAXCallBackExecutionCommand new
				callbackUrl:  callbackURL;
				cssQuery: aCssSelector;
				yourself)