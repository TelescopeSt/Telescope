"
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

"
Class {
	#name : #TLCytoscapeCompositeExportStrategy,
	#superclass : #TLCytoscapeAbstractExportStrategy,
	#instVars : [
		'strategies'
	],
	#category : 'Telescope-Cytoscape-Export'
}

{ #category : #'instance creation' }
TLCytoscapeCompositeExportStrategy class >> withAll: aCollectionOfStrategies [
	^ self new
		addStrategies: aCollectionOfStrategies;
		yourself
]

{ #category : #adding }
TLCytoscapeCompositeExportStrategy >> addStrategies: aCollection [
	aCollection do: [ :each | self addStrategy: each ]
]

{ #category : #adding }
TLCytoscapeCompositeExportStrategy >> addStrategy: aTLCytoscapeExportStrategy [
	self strategies add: aTLCytoscapeExportStrategy
]

{ #category : #initialization }
TLCytoscapeCompositeExportStrategy >> initialize [
	super initialize.
	strategies := OrderedCollection new
]

{ #category : #rendering }
TLCytoscapeCompositeExportStrategy >> renderDownloadButtonForVisu: aVisuId on: html [
	self strategies do: [ :each | each renderDownloadButtonForVisu: aVisuId on: html ]
]

{ #category : #accessing }
TLCytoscapeCompositeExportStrategy >> strategies [
	^ strategies
]
