generation - legend
generateLegend: aTLLegend
	"In cytoscape, no need to add the whole legend to the visu, each item will be added separately"

	aTLLegend legendEntries do: [ :entry | entry generateWith: self ]