Description
------------------

I am a dynamic legend entry to describe the border colors of the entites. 
I should probably not be call directly but via an helper method of a TLLegend.

Examples
------------------

	aTLLegend
		addLegendEntry:
			(TLNodeBorderColorLegendEntry
				description: [ :entity | 
					entity isDead
						ifTrue: [ 'Dead entity' ]
						ifFalse: [ 'Normal Entity' ] ]
				context: [ aVisualisation allNodes ])
				
			
	"Via the legend API"
	aVisualization legend borderColorDescription: [ :ent | 
					ent allProviders
						ifEmpty: [ 'Has no dependency'  ]
						ifNotEmpty: [ 'Has dependencies') ] ]
			forNodes: [ aVisualization allNodesRecursively ];
	