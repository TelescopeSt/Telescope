Description
--------------------

I am an export strategy to use when you want multiple exports.

Examples
--------------------

	html
		render:
			((TLCytoscapeComponent visualization: visu id: visuId)
				exportStrategy:
					(TLCytoscapeCompositeExportStrategy
						withAll:
							{TLCytoscapePngExportStrategy new.
							TLCytoscapeJSONExportStrategy new});
				yourself)
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	strategies:		<aCollection>	The export strategies to use for the visualization
