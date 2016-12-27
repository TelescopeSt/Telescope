execution-interaction
executeInteraction: anInteraction forDrawables: drawables 
	| visualization |
	visualization := drawables anyOne visualization.	"we have to memorize the visualization because we are not sure the element will still be part of visualization after action"
	drawables do: [ :aTLDrawable | anInteraction actionOn: aTLDrawable ].
	visualization update