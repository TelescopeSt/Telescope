"
I am the seaside component used for demos
"
Class {
	#name : #TLCytoscapeTelescopeDemoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'filters',
		'method',
		'debugVisu'
	],
	#category : 'Telescope-Demo-Cytoscape'
}

{ #category : #initialization }
TLCytoscapeTelescopeDemoComponent class >> initialize [
	| app |
	app := WAAdmin register: self asApplicationAt: 'TelescopeWebDemo'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: CYSFileLibrary;
		addLibrary: CYSDemoFileLibrary
]

{ #category : #accessing }
TLCytoscapeTelescopeDemoComponent >> allFilters [
	^ TLAbstractDemoFilter allSubclasses
]

{ #category : #accessing }
TLCytoscapeTelescopeDemoComponent >> codeOf: aMethod [
	"I take a method selector I contains and return his source code without the declaration."

	^ String
		streamContents: [ :stream | 
			(aMethod sourceCode lines allButFirst: 2)
				do: [ :ea | stream nextPutAll: ea ]
				separatedBy: [ stream nextPutAll: GRPlatform current newline ] ]
]

{ #category : #accessing }
TLCytoscapeTelescopeDemoComponent >> defaultDemo [
	| visu |
	visu := TLVisualization new.
	visu
		childrenProperty: [ :i | 
			{(i * 10).
			(i * 15)} ].
	visu addNodesFromEntities: #(1 2).
	visu styleSheet
		nodeLabel: #asString.
	^visu
]

{ #category : #visu }
TLCytoscapeTelescopeDemoComponent >> drillDownAction: html onVisu: visuId [
	| interaction |
	interaction := TLExpandCollapseCompositeNodeAction new
		condition: [ :drawable | 
					drawable isNode
						and: [ 
							drawable isComposite
								and: [ 
									drawable childrenNodes
										ifEmpty: [ true ]
										ifNotEmpty: [ drawable childrenNodes anySatisfy: [ :child | child isVisible not ] ] ] ] ];
		onExternalTrigger.
	html button
		onClick: (interaction externalTriggerForVisuId: visuId);
		with: 'Click to unfold Composite'.
	^ interaction
]

{ #category : #visu }
TLCytoscapeTelescopeDemoComponent >> externalTriggerExemple: html onVisu: visuId [
	| interaction |
	interaction := ((TLStyleCustomizationAction
		custom: [ :style | style borderColor: MDLColor red ])
		condition: [ :elem | elem isNode and: [ elem isComposite ] ]) onExternalTrigger.
	html button
		onClick: (interaction externalTriggerForVisuId: visuId);
		with: 'Click on me to color composite in red'.	"(interaction triggerOnLeavesForVisuId: visuId)"
	^ interaction
]

{ #category : #accessing }
TLCytoscapeTelescopeDemoComponent >> filteredMethods [
	^ (self filters
		inject: Set new
		into: [ :res :filterClass | 
			res addAll: ((PragmaCollector new filter: [ :prg | prg keyword = 'tlFilter:' and: [ (prg argumentAt: 1) = filterClass filterSymbol ] ]) reset collect: #method).
			res ]) sorted: [ :a :b | a selector < b selector ]
]

{ #category : #accessing }
TLCytoscapeTelescopeDemoComponent >> filters [
	^ filters ifNil: [ filters := TLAbstractDemoFilter allSubclasses asOrderedCollection ]
]

{ #category : #accessing }
TLCytoscapeTelescopeDemoComponent >> method [
	^method
]

{ #category : #accessing }
TLCytoscapeTelescopeDemoComponent >> method: symbol [
	method := symbol
]

{ #category : #rendering }
TLCytoscapeTelescopeDemoComponent >> renderChipLabelled: label selected: aBoolean doing: aBlock on: html [
	html span
		class: #chip;
		class: #isSelected if: aBoolean;
		onClick:
				(html jQuery
						script: [ :s | 
							s
								<<
									((html jQuery id: #'telescope-filters') load
										html: [ :r | 
											aBlock value.
											self renderFiltersOn: r ]).
							s << ((html jQuery id: #'telescope-selection__list') load html: [ :r | self renderListContentOn: r ]) ]);
		with: [ html span: label ]
]

{ #category : #rendering }
TLCytoscapeTelescopeDemoComponent >> renderCodePanelOn: html [
	html preformatted
		id: #code;
		style: 'width: 100%;';
		with: [ html code
				class: 'smalltalk';
				with: (self codeOf: (self method ifNotNil: [ :m | TLDemos class >> m asSymbol ] ifNil: [ self class >> #defaultDemo ])) ]
]

{ #category : #rendering }
TLCytoscapeTelescopeDemoComponent >> renderContentOn: html [
	(html tag: #main)
		with: [ html div
				id: 'telescope-filters';
				with: [ self renderFiltersOn: html ].
			html div
				id: 'telescope-content';
				with: [ self renderMainContentOn: html ] ].
	html document addLoadScript: (JSStream on: 'hljs.initHighlighting();initResizer();initTabs();')
]

{ #category : #rendering }
TLCytoscapeTelescopeDemoComponent >> renderDebugPanelOn: html [
	html render: (TLCytoscapeComponent visualization: debugVisu)
]

{ #category : #rendering }
TLCytoscapeTelescopeDemoComponent >> renderDemoPanelOn: html [
	| visu visuId |
	visuId := TLCytoscapeComponent generateId.
	visu := self method ifNil: [ self defaultDemo ] ifNotNil: [ TLDemos executeDemo: self method ].
	debugVisu := TLDebuggingVisualizationTreeViewer visu: visu.
	visu addInteraction: (self externalTriggerExemple: html onVisu: visuId).
	visu addInteraction: (self drillDownAction: html onVisu: visuId).
	visu addInteraction: ((TLCustomWithParameterAction block: [ :aDrawable :aDroppedDrawable | aDroppedDrawable parentNode: aDrawable ]) updateAlso: debugVisu) onDrop.
	html
		render:
			((TLCytoscapeComponent visualization: visu id: visuId)
				exportStrategy:
					(TLCytoscapeCompositeExportStrategy
						withAll:
							{TLCytoscapePngExportStrategy new.
							TLCytoscapeJSONExportStrategy new});
				yourself)
]

{ #category : #rendering }
TLCytoscapeTelescopeDemoComponent >> renderFiltersOn: html [
	self
		renderChipLabelled: 'All'
		selected: self filters size = self allFilters size
		doing: [ self filters addAll: self allFilters ]
		on: html.
	self
		renderChipLabelled: 'Remove All'
		selected: self filters isEmpty
		doing: [ self filters removeAll ]
		on: html.
	self allFilters
		do: [ :filter | 
			self
				renderChipLabelled: filter filterSymbol capitalized
				selected: (self filters includes: filter)
				doing: [ self toggleFilter: filter ]
				on: html ]
]

{ #category : #rendering }
TLCytoscapeTelescopeDemoComponent >> renderListContentOn: html [
	html
		unorderedList: [ self filteredMethods
				do: [ :each | 
					html listItem
						class: 'isSelected' if: self method = each selector;
						onClick:
							((html jQuery id: 'telescope-content') load
								html: [ :r | 
									self method: each selector.
									self renderMainContentOn: r ];
								onComplete: (JSStream on: 'initResizer();initTabs();$("pre > code").each(function(){hljs.highlightBlock(this);});telescope.loadVisuIn(document);'));
						with: (each selector allButFirst: 7) ] ]
]

{ #category : #rendering }
TLCytoscapeTelescopeDemoComponent >> renderMainContentOn: html [
	html div
		id: 'telescope-selection';
		with: [ html div
				id: 'telescope-selection__list';
				with: [ self renderListContentOn: html ].
			html div class: #resizer ].
	html div
		id: 'telescope-panel';
		with: [ self renderPanelsOn: html ]
]

{ #category : #rendering }
TLCytoscapeTelescopeDemoComponent >> renderPanelsOn: html [
	| panels |
	panels := OrderedDictionary with: 'demo' -> #renderDemoPanelOn: with: 'code' -> #renderCodePanelOn: with: 'debug' -> #renderDebugPanelOn:.
	html div
		id: 'telescope-panel__tabs';
		with: [ panels
				keysDo: [ :name | 
					html anchor
						url: '#tl' , name;
						class: 'tab';
						class: #isActive if: name = 'demo';
						with: name capitalized ] ].
	panels
		keysAndValuesDo: [ :name :meth | 
			html div
				id: 'tl' , name;
				class: #panel;
				class: #isActive if: name = 'demo';
				with: [ self perform: meth with: html ] ]
]

{ #category : #accessing }
TLCytoscapeTelescopeDemoComponent >> toggleFilter: aFilter [
	(self filters includes: aFilter)
		ifTrue: [ self filters remove: aFilter ]
		ifFalse: [ self filters add: aFilter ]
]

{ #category : #updating }
TLCytoscapeTelescopeDemoComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Telescope web demo'.
	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/css?family=Roboto'.
	anHtmlRoot script url: 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/highlight.min.js'.
	anHtmlRoot script url: 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/smalltalk.min.js'.
	anHtmlRoot bodyAttributes at: #style put: 'margin-bottom: 0 !important;'
]
