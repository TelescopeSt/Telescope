generation - legend
generateNodeShapeLegendEntry: aLegendEntry
	(aLegendEntry obtainAssociations
		collect: [ :collection | 
			| drawable |
			drawable := collection anyOne.
			drawable effectiveStyleSheet obtainValue: #shape forEntity: drawable entity inNode: drawable ])
		associationsDo: [ :labelAndColor | 
			self
				addCommand:
					(TLVisualizationAddLegendEntryCommand
						visuId: self visuId
						html:
							'<td class="tlLegendIcon""><img style="width: 30px;height: 30px;" src="' , (CYSFileLibrary urlOf: labelAndColor value forCytoscapeNode , '.png') asString
								, '"></td><td class="tlLegendLabel">' , labelAndColor key , '</td>') ].
	^ aLegendEntry