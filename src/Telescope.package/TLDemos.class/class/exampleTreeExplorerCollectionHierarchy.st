demos
exampleTreeExplorerCollectionHierarchy
	<script: 'self exampleTreeExplorerCollectionHierarchy open'>
	<tlFilter: #visuTemplate>

	| visualization |
	self flag: #clean.	"BROKEN FOR NOW. Because of triggers"
	visualization := TLTreeExplorer root: Collection expandProperty: #subclasses.

	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization