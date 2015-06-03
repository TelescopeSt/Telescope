demos
exampleTreeExplorerCollectionHierarchy
	"self exampleTreeExplorerCollectionHierarchy"

	| visualization |
	visualization := TLTreeExplorer root: Collection expandProperty: #subclasses.

	visualization addInteraction: TLNodeBasicInteraction popup.
	visualization addInteraction: TLNodeBasicInteraction draggable.
	visualization open.
	^ visualization