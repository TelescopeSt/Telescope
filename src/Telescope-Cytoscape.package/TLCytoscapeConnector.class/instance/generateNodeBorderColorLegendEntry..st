generation - legend
generateNodeBorderColorLegendEntry: aLegendEntry
	(aLegendEntry obtainAssociations
		collect: [ :collection | 
			| drawable |
			drawable := collection anyOne.
			drawable effectiveStyleSheet obtainValue: #borderColor forEntity: drawable entity inNode: drawable ])
		associationsDo: [ :labelAndColor | 
			self
				addCommand:
					(TLVisualizationAddLegendEntryCommand
						visuId: self visuId
						html:
							'<td class="tlLegendIcon" style="border: 2px solid ' , labelAndColor value forCytoscape
								, '"></td><td class="tlLegendLabel">' , labelAndColor key , '</td>') ].
	^ aLegendEntry