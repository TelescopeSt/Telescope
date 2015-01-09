building
buildVisualization
	self nodeBuilder: (TLCompositeNodeBuilder childrenProperty: self properties).
	self nodeBuilder childrenLayout: RTVerticalLineLayout.
	self nodeBuilder backgroundColor: Color white.
	self nodeBuilder borderColor: Color black.
	self nodeBuilder nodeLabel: #name position: #top.
	self nodeBuilder childrenNodeBuilder: (TLCompositeNodeBuilder childrenProperty: [ :property | property value: self entity ]).
	self nodeBuilder childrenNodeBuilder nodeLabel: [ :property | self titleToProperty keyAtValue: property ] position: #top.
	self nodeBuilder childrenNodeBuilder backgroundColor: Color white.
	self nodeBuilder childrenNodeBuilder borderColor: Color black.
	self nodeBuilder childrenNodeBuilder childrenLayout: (RTVerticalLineLayout new verticalGap: 0).
	self nodeBuilder childrenNodeBuilder childrenNodeBuilder backgroundColor: Color transparent.
	self nodeBuilder childrenNodeBuilder childrenNodeBuilder nodeLabel: #name position: #inside.
	self > #default addNodeFromEntity: self entity