Description
--------------------

This class takes care of computing the node width from its label size. In case there is no label the user can specify a default value to use.

If a node has no label and the default value is not set, I will raise an error to the user.

Example
--------------------

	| visu |
	visu := TLVisualization new.
	visu styleSheet
		nodeLabel: #asString;
		adaptNodeWidthFromLabelWithDefault: 20.
	visu addNodesFromEntities: ((0 to: 26) collect: [ :number | Character alphabet first: number ]).
	^ visu
 
Internal Representation and Key Implementation Points.
-------------------

    Instance Variables
	defaultWidth:		<anInteger> The default width of a node without label
