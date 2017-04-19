demos
exampleSystemComplexityInContainer
	<script: 'self exampleSystemComplexityInContainer open'>
	<tlFilter: #layout>
	| visualization |
	visualization := TLSystemComplexity new
		root: Collection;
		property: #subclasses;
		container: #package.
	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization