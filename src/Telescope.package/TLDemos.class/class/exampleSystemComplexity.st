demos
exampleSystemComplexity
	<script: 'self exampleSystemComplexity open'>
	<tlFilter: #layout>
	| visualization |
	visualization := TLSystemComplexity new
		root: Collection;
		property: #subclasses.
	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization