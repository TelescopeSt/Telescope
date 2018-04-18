rendering
renderDemoPanelOn: html
	| visu visuId |
	visuId := TLCytoscapeComponent generateId.
	visu := self method ifNil: [ self defaultDemo ] ifNotNil: [ TLDemos executeDemo: self method ].
	debugVisu := TLDebuggingVisualizationTreeViewer visu: visu.
	visu addInteraction: (self externalTriggerExemple: html onVisu: visuId).
	visu addInteraction: (self drillDownAction: html onVisu: visuId).
	visu addInteraction: ((TLCustomWithParameterAction block: [ :aDrawable :aDroppedDrawable | aDroppedDrawable parentNode: aDrawable ]) updateAlso: debugVisu) onDrop.
	html
		render:
			((TLCytoscapeComponent visualization: visu id: visuId)
				exportStrategy:
					(TLCytoscapeCompositeExportStrategy
						withAll:
							{TLCytoscapePngExportStrategy new.
							TLCytoscapeJSONExportStrategy new});
				yourself)