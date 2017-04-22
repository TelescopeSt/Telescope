demos
exampleTreeExplorerCollectionHierarchy
	<script: 'self exampleTreeExplorerCollectionHierarchy open'>
	<tlFilter: #visuTemplate>

	| visualization |
	visualization := TLTreeExplorer root: Collection expandProperty: #subclasses.

	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization