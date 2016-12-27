Description
-------------------

A TLStyleCustomizationAction is an action that change the style of  drawables. This action can be reverted. 

I can be parametrized to chose my targets and the style to change. 

Public API and Key Messages
-------------------
- #customizationBlock: aBlock 		I should have a block taking as parameter the style of a drawable and  changing his style.
- #target: aBlock 					I should also have a block taking as parameter the drawable receiving the interaction and returning the collection of drawables to change.

Example 
--------------------
 
	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet nodeLabel: #asString.
	visualization 
		addNodesFromEntities: (1 to: 10);
		addInteraction: (TLStyleCustomizationAction custom: [:style | style backgroundColor: Color red]) onMouseOver.
	^ visualization
	
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	customizationBlock:			<aBlock> 		I am a block taking as parameter the style of an element and modifying it.
	previousStyleDictionary:		<aDictionary>	I am an internal mechanisme to save which drawables received an interaction and which drawables where impacted.
	target:						<aBlock>		I am a block taking as parameter the drawable receiving the interaction and returning the drawables to customize.
