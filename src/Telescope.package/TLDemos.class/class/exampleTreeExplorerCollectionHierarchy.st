demos
exampleTreeExplorerCollectionHierarchy
	"self exampleTreeExplorerCollectionHierarchy"
	| visualization |
	visualization := TLTreeExplorer new
		root: Collection;
		property: #subclasses;
		yourself.
	visualization nodeBuilder shapeBuilder: TLEllipseShape new.
	visualization nodeBuilder nodeLabel: #name position: #inside.
	visualization nodeBuilder addInteraction: TLNodeBasicInteraction popup.
	visualization nodeBuilder addInteraction: TLNodeBasicInteraction draggable.
	visualization open.
	^ visualization 