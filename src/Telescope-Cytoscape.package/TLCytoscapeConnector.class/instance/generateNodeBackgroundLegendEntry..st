generation - legend
generateNodeBackgroundLegendEntry: aTLNodeBackgroundLegendEntry
	(aTLNodeBackgroundLegendEntry obtainAssociations
		collect: [ :collection | 
			| drawable |
			drawable := collection anyOne.
			drawable effectiveStyleSheet obtainValue: #backgroundColor forEntity: drawable entity ]) associations
		do: [ :labelAndColor | 
			self
				addCommand:
					(TLVisualizationAddLegendEntryCommand
						visuId: self visuId
						html:
							'<td class="tlLegendIcon" style="background-color:' , labelAndColor value forCytoscape
								, '"></td><td class="tlLegendLabel">' , labelAndColor key , '</td>') ].
	^ aTLNodeBackgroundLegendEntry