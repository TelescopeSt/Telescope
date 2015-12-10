demos
exampleSystemComplexity
	<script: 'self exampleSystemComplexity open'>
	| visualization |
	visualization := TLSystemComplexity new
		root: Collection;
		property: #subclasses.
	visualization addInteraction: (TLNodeBasicInteraction popup: #yourself).
	^ visualization