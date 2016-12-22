demos
exampleTreeExplorerCollectionHierarchy
	<script: 'self exampleTreeExplorerCollectionHierarchy open'>

	| visualization |
	visualization := TLTreeExplorer root: Collection expandProperty: #subclasses.

	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization