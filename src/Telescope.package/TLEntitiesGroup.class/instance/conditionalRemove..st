accessing
conditionalRemove: aBlock
	(self telescopeEntities select: aBlock) do: [ :node | self remove: node ]