accessing
childrenNodeBuilder: aTLNodeBuilder
	childrenNodeBuilder := aTLNodeBuilder.
	childrenNodeBuilder visualization: self visualization.
	"aTLNodeBuilder isCompositeNodeBuilder ifTrue: [ childrenNodeBuilder expandedByDefault: false ]"