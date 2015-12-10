demos
exampleSystemComplexityInContainer
	<script: 'self exampleSystemComplexityInContainer open'>
	| visualization |
	visualization := TLSystemComplexity new
		root: Collection;
		property: #subclasses;
		container: #package.
	visualization addInteraction: (TLNodeBasicInteraction popup: #yourself).
	^ visualization