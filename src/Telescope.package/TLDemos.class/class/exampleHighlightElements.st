demos
exampleHighlightElements
	"self exampleHighlightElements"

	| visualization |
	visualization := TLVisualization new.
	visualization addInteraction: (TLStyleCustomizationAction custom: [ :style | style borderColor: Color red lighter ]) onClick.
	visualization layout: RTCircleLayout new.
	visualization addNodesFromEntities: ($a to: $z).
	visualization connectFollowingProperty: [ :aChar | (1 to: ((0 to: 3) atRandom)) collect: [ :i | (($a to: $z) \ { aChar }) atRandom ] ].
	visualization open.
	^ visualization