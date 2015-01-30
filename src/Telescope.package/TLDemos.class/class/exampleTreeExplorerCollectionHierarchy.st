demos
exampleTreeExplorerCollectionHierarchy
	"self exampleTreeExplorerCollectionHierarchy"

	| visualization |
	visualization := TLTreeExplorer root: Collection expandProperty: #subclasses.

	visualization nodeBuilder addInteraction: TLNodeBasicInteraction popup.
	visualization nodeBuilder addInteraction: TLNodeBasicInteraction draggable.
	visualization open.
	^ visualization