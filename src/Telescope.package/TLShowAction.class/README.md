Description
--------------------

A TLShowAction is an action that will show a drawable. This action is reversible and can hide the drawable.

Example
--------------------

	| visualization |
	visualization := TLVisualization new.
	"Define a first node" 
	(visualization addNodeFromEntity: 1)  addInteraction: (TLShowAction on: (visualization addNodeFromEntity: 2) hide; yourself) onMouseOver. 
	"Define an interaction on a second node. When the mouse will enter the first node, the second will desapear. When the mouse will leave the first node, the socond node will by redrawn."
	^ visualization
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	shownDrawables:			<aDictionary>		This dictionary will keep for each drawable the elements he show.
	showingValuableOrEntity:		<aBlockOrEntity>		A block or an entity taking as parameter a drawble and returning the entities to show.
