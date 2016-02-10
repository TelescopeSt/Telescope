as yet unclassified
renderContentOn: html
	| visuId |
	visuId := self visuDivId.
	TLCytoscapeWebSocketDelegate registerVisualization: self visualization underId: visuId.
	html div
		id: visuId;
		attributeAt: #isTelescopeVisu put: 'true';
		class: 'telescopeVisu'