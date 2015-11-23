demos
exampleSystemComplexityInContainer
	"self exampleSystemComplexityInContainer"
	| visualization |
	visualization := TLSystemComplexity new
		root: Collection;
		property: #subclasses;
		container: #package.
	visualization addInteraction: (TLNodeBasicInteraction popup: #yourself).
	visualization open.
	^ visualization