demos
exampleSystemComplexity
	<script: 'self exampleSystemComplexity open'>
	<tlFilter: #visuTemplate>
	| visualization |
	self flag: #clean.	"BROKEN FOR NOW."
	visualization := TLSystemComplexity new
		root: Collection;
		property: #subclasses.
	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization