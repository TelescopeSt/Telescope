"
This visualization represents the visualization of a name cloud for a moose group on Moose.
"
Class {
	#name : #TLNameCloud,
	#superclass : #TLVisualization,
	#instVars : [
		'entities',
		'nameProperty'
	],
	#category : #'Telescope-VisualizationTemplates-Core'
}

{ #category : #accessing }
TLNameCloud class >> maxLabelSize [
	^ 46
]

{ #category : #accessing }
TLNameCloud class >> minLabelSize [
	^ 6
]

{ #category : #naming }
TLNameCloud class >> stopWordList [
	"Answer a list of english stop words, a defind by SMART.  See ftp://ftp.cs.cornell.edu/pub/smart/"

	^'a a''s able about above according accordingly across actually after afterwards again against ain''t all allow allows almost alone along already also although always am among amongst an and another any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are aren''t around as aside ask asking associated at available away awfully b be became because become becomes becoming been before beforehand behind being believe below beside besides best better between beyond both brief but by c c''mon c''s came can can''t cannot cant cause causes certain certainly changes clearly co com come comes concerning consequently consider considering contain containing contains corresponding could couldn''t course currently d definitely described despite did didn''t different do does doesn''t doing don''t done down downwards during e each edu eg eight either else elsewhere enough entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example except f far few fifth first five followed following follows for former formerly forth four from further furthermore g get gets getting given gives go goes going gone got gotten greetings h had hadn''t happens hardly has hasn''t have haven''t having he he''s hello help hence her here here''s hereafter hereby herein hereupon hers herself hi him himself his hither hopefully how howbeit however i i''d i''ll i''m i''ve ie if ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into inward is isn''t it it''d it''ll it''s its itself j just k keep keeps kept know knows known l last lately later latter latterly least less lest let let''s like liked likely little look looking looks ltd m mainly many may maybe me mean meanwhile merely might more moreover most mostly much must my myself n name namely nd near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor normally not nothing novel now nowhere o obviously of off often oh ok okay old on once one ones only onto or other others otherwise ought our ours ourselves out outside over overall own p particular particularly per perhaps placed please plus possible presumably probably provides q que quite qv r rather rd re really reasonably regarding regardless regards relatively respectively right s said same saw say saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent serious seriously seven several shall she should shouldn''t since six so some somebody somehow someone something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such sup sure t t''s take taken tell tends th than thank thanks thanx that that''s thats the their theirs them themselves then thence there there''s thereafter thereby therefore therein theres thereupon these they they''d they''ll they''re they''ve think third this thorough thoroughly those though three through throughout thru thus to together too took toward towards tried tries truly try trying twice two u un under unfortunately unless unlikely until unto up upon us use used useful uses using usually uucp v value various very via viz vs w want wants was wasn''t way we we''d we''ll we''re we''ve welcome well went were weren''t what what''s whatever when whence whenever where where''s whereafter whereas whereby wherein whereupon wherever whether which while whither who who''s whoever whole whom whose why will willing wish with within without won''t wonder would would wouldn''t x y yes yet you you''d you''ll you''re you''ve your yours yourself yourselves z zero'
		runsFailing: #isSeparator
]

{ #category : #building }
TLNameCloud >> buildVisualization [
	| objects minOcc maxOcc |
	objects := self sortedSymbolsToDisplay.
	minOcc := (objects collect: #value) min.
	maxOcc := (objects collect: #value) max.
	"The background and border color here are hacks because CYtoscape does not manage the TLNoShape shape for now."
	(self > #names) styleSheet
		"onlyLabelForNodes;"
		nodeLabel: #key;
		backgroundColor: Color transparent;
		borderColor: Color transparent;
		adaptNodeWidthFromLabel;
		labelSize: [ :each | | size | size := self relativeSizeOf: each value withMin: minOcc andMax: maxOcc. size logCr. size ].
	(self > #names)
		addNodesFromEntities: objects;
		addInteraction: (TLPopUpAction text: [ :each | each value asString, ' occurences.' ]) onMouseOver;
		layout: (TLLinearLayout ratio: 16/9)
]

{ #category : #accessing }
TLNameCloud >> entities [
	^ entities
]

{ #category : #accessing }
TLNameCloud >> entities: anObject [
	entities := anObject
]

{ #category : #accessing }
TLNameCloud >> nameProperty [
	^ nameProperty
]

{ #category : #accessing }
TLNameCloud >> nameProperty: anObject [
	nameProperty := anObject
]

{ #category : #building }
TLNameCloud >> relativeSizeOf: aSize withMin: minOcc andMax: maxOcc [
	^ ((self class maxLabelSize - self class minLabelSize) / ((maxOcc - minOcc) / aSize) + self class minLabelSize) asInteger
]

{ #category : #building }
TLNameCloud >> sortedSymbolsToDisplay [
	| objects |
	objects := OrderedCollection new.
	"Here we sort the entries to put the ones with the highest values to the center of the visu."
	(self symbolsUsedInNames associations sorted: [ :a :b | a value > b value ])
		doWithIndex: [ :each :ind | 
			ind even
				ifTrue: [ objects addFirst: each ]
				ifFalse: [ objects addLast: each ] ].
	^ objects
]

{ #category : #utilities }
TLNameCloud >> symbolsUsedInNames [
	| symbols nospace |
	symbols := self entities
		flatCollect: [ :each | 
			nospace := ((self nameProperty value: each)
				piecesCutWhere: [ :a :b | 
					{Character space.
					$_} includes: a ]) collect: [ :token | (token replaceAll: $_ with: Character space) trim ].
			nospace flatCollect: [ :x | x piecesCutWhereCamelCase collect: [ :y | each -> (MalStemmer English stem: y) ] ] ].
	^ (symbols reject: [ :each | self class stopWordList includes: each value ]) asOrderedCollection groupedBy: #value affect: #size
]
