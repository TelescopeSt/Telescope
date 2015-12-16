demos
exampleHighlightElements
	<script: 'self exampleHighlightElements open'>

	| visualization highlightInteraction |

	visualization := TLVisualization new.
	highlightInteraction := (TLStyleCustomizationAction custom: [ :style | style borderColor: Color red lighter; color: Color red lighter. style width: 3 ]) onMouseOver.
	visualization addInteraction: highlightInteraction.
	visualization addInteraction: (TLCustomAction block: [:drawable | visualization close. TLVisualization new addNodeFromEntity: (drawable entity); open]) onClick.
	visualization layout: RTCircleLayout new.
	visualization addNodesFromEntities: ($a to: $z).
	"By default connections do not inherit interactions so I have to define it"
	(visualization connectFollowingProperty: [ :aChar | (1 to: ((0 to: 3) atRandom)) collect: [ :i | (($a to: $z) \ { aChar }) atRandom ] ]) addInteraction: highlightInteraction.
	^ visualization