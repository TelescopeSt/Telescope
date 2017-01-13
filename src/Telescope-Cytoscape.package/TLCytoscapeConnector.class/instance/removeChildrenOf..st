removing - node
removeChildrenOf: aCompositeNode
	super removeChildrenOf: aCompositeNode.	"we need also to remove it in the virtual hierarchy"
	(self elementFromTLDrawable: aCompositeNode) children removeAll