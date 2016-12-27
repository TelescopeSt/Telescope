execution-interaction
executeInteraction: anInteraction parameter: aParameter forDrawable: aTLDrawable
	| visualization |
	visualization := aTLDrawable visualization.	"we have to memorize the visualization because we are not sure the element will still be part of visualization after action"
	anInteraction actionOn: aTLDrawable parameter: aParameter.
	visualization update