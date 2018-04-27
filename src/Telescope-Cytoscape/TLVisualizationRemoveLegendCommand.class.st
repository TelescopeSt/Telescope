"
I am a command that ask the client to remove the legend
"
Class {
	#name : #TLVisualizationRemoveLegendCommand,
	#superclass : #TLVisualizationServerCommand,
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationRemoveLegendCommand class >> command [
	^ #removeLegend
]
