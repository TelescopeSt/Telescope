as yet unclassified
renderContentOn: html
	| visuId |
	visuId := self visuDivId.
	TLCytoscapeWebSocketDelegate registerVisualization: self visualization underId: visuId.
	html div
		id: visuId;
		attributeAt: #isTelescopeVisu put: 'true';
		style:
				'width: ' , self visualization openingDimension x asString , 'px; height: '
						, self visualization openingDimension y asString , 'px; display: block;'