"
Description
--------------------

I am a simple template to show, from a MetacelloVersion, a project map of the dependencies. 

For now I show only the project dependencies. In the future I could show the dependencies between packages.

Public API and Key Messages
--------------------

- #version: 		Setter of the MetacelloVersion

Examples
--------------------

	 TLProjectMap version: ConfigurationOfTelescope project development
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	version:		<MetacelloVersion>	The version to get the project map

"
Class {
	#name : #TLProjectMap,
	#superclass : #TLVisualization,
	#instVars : [
		'version'
	],
	#category : #'Telescope-VisualizationTemplates'
}

{ #category : #'instance creation' }
TLProjectMap class >> version: aMetacelloVersion [
	^ self new
		version: aMetacelloVersion;
		yourself
]

{ #category : #building }
TLProjectMap >> buildVisualization [
	super buildVisualization.
	self addNodesFromEntities: self versionsNodes.
	self connectFollowingProperty: [ :each | each projects collect: #version ].
	self styleSheet
		nodeLabel: [ :each | #(#ConfigurationOf #BaselineOf) inject: each asString into: [ :name :toRemove | name copyReplaceAll: toRemove with: '' ] ];
		nodeLabelPosition: #bottom;
		labelSize: 11.
	self layout: self defaultLayout
]

{ #category : #accessing }
TLProjectMap >> defaultLayout [
	^ TLTreeLayout rightToLeft
		leavesGap: 150;
		levelGap: 100;
		yourself
]

{ #category : #accessing }
TLProjectMap >> version: anObject [
	version := anObject
]

{ #category : #accessing }
TLProjectMap >> versionsNodes [
	"This is currently a hack. Ideally we should just use #withDeepCollect: [ … ] as: Set. The problem is that, for now, the MetacelloVersion takes only the versionNumber into account and not the project name. If two different project has the same version number, we will lose one. Maybe in the future we will be able to make this code simpler. See: https://github.com/dalehenrich/metacello-work/issues/437"

	^ (version withDeepCollect: [ :each | each projects collect: #version ])
		inject: OrderedCollection new
		into: [ :coll :vers | 
			coll detect: [ :each | each versionNumber = vers versionNumber and: [ each projectLabel = vers projectLabel ] ] ifNone: [ coll add: vers ].
			coll ]
]
