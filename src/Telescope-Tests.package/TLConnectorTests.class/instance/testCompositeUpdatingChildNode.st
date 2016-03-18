tests
testCompositeUpdatingChildNode
	| group  composite  |
	group := TLEntitiesGroup new.
	group styleSheet expandCompositeNodes.
	group generator: connector.
	composite := group addCompositeNodeFromEntity: #parent children: #(child1).
	group generate.
	self assert: connector shapeByDrawable size equals: 4.
	"group + composite + composite children group + child1"
	composite childrenNodes first requireUpdate.
	self assert: composite isUpdateRequired.
	group update.
	self deny: composite isUpdateRequired.
	self assert: connector shapeByDrawable size equals: 4.
	