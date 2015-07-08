demos
exampleHighlightElements
	"self exampleHighlightElements"

	| visualization highlightInteraction |
	visualization := TLVisualization new.
	highlightInteraction := (TLStyleCustomizationAction custom: [ :style | style borderColor: Color red lighter ]) onClick.
	visualization addInteraction: highlightInteraction.
	visualization layout: RTCircleLayout new.
	visualization addNodesFromEntities: ($a to: $z).
	(visualization connectFollowingProperty: [ :aChar | (1 to: ((0 to: 3) atRandom)) collect: [ :i | (($a to: $z) \ { aChar }) atRandom ] ]) addInteraction: highlightInteraction.
	visualization open.
	^ visualization