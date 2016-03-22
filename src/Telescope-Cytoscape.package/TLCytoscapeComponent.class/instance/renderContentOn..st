rendering
renderContentOn: html
	| visuId |
	visuId := self visuDivId.
	TLCytoscapeWebSocketDelegate registerVisualization: self visualization underId: visuId.
	html div
		id: visuId;
		attributeAt: #isTelescopeVisu put: 'true';
		class: 'telescopeVisu';
		with: [ 
					html div
						class: 'visualization';
						style: 'height: 100%; width: 100%;'.
					(self waitingMessage value: html) ]