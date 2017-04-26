demos
exampleSystemComplexityInContainer
	<script: 'self exampleSystemComplexityInContainer open'>
	<tlFilter: #visuTemplate>
	| visualization |
	self flag: #clean.	"BROKEN FOR NOW."
	visualization := TLSystemComplexity new
		root: Collection;
		property: #subclasses;
		container: #package.
	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization