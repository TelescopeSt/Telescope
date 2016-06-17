rendering
renderContentOn: html
	| visuId div callback |
	visuId := self visuDivId.
	div := html div
		id: visuId;
		style: self style;
		attributeAt: #isTelescopeVisu put: 'true';
		class: 'telescopeVisu';
		with: [ 
					html div
						class: 'visualization';
						style: 'height: 100%; width: 100%;'.
					self waitingMessage value: html.
					html div
						class: 'fitButton';
						with: [ 
							html anchor
								onClick: 'visuWithId(' , self visuDivId asString , ').fit();';
								with: 'Reset' ] ];
		yourself.
	callback := WAValueCallback new.
	TLCytoscapeWebSocketDelegate
		registerVisualization: self visualization
		underId: visuId
		withCallBack: callback
		callbackUrl:
			{(html actionUrl asString).
			(div storeCallback: callback)}