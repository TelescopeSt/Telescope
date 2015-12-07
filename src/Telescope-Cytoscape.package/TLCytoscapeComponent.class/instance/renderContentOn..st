as yet unclassified
renderContentOn: html
	| visuId |
	visuId := self visuDivId.
	TLCytoscapeWebSocketDelegate registerVisualization: self visualization underId: visuId.
	html div id: visuId; attributeAt: #isTelescopeVisu put: 'true'; style: 'width: 2000px; height: 1000px; display: block;'
	