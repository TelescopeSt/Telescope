demos
exampleTreeExplorerCollectionHierarchy
	<script: 'self exampleTreeExplorerCollectionHierarchy open'>

	| visualization |
	visualization := TLTreeExplorer root: Collection expandProperty: #subclasses.

	visualization addInteraction: TLNodeBasicInteraction popup.
	visualization addInteraction: TLNodeBasicInteraction draggable.
	^ visualization