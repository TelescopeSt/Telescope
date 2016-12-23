Description
--------------------

A TLHideAction is an action that will hyde a drawable. This action is reversible and can restore the drawable.

Example
--------------------

	| visualization |
	visualization := TLVisualization new.
	"Define a first node" 
	(visualization addNodeFromEntity: 1)  addInteraction: (TLHideAction on: (visualization addNodeFromEntity: 2)) onMouseOver. 
	"Define an interaction on a second node. When the mouse will enter the first node, the second will desapear. When the mouse will leave the first node, the socond node will by redrawn."
	^ visualization
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	hiddedDrawables:			<aDictionary>		This dictionary will keep for each drawable the elements he hides.
	hidingValuableOrEntity:		<aBlockOrEntity>		A block or an entity taking as parameter a drawble and returning the entities to hide.
