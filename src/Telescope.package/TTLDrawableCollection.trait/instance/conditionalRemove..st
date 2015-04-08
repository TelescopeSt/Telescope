accessing
conditionalRemove: aBlock
	(self collection select: aBlock) do: [ :node | self remove: node ]