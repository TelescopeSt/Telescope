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
								, ';box-shadow: 0px 0px 5px -1px rgba(0,0,0,0.4);"></td><td class="tlLegendLabel">' , labelAndColor key , '</td>') ].
	^ aLegendEntry