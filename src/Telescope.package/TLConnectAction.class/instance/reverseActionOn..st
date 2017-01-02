action
reverseActionOn: aNode
	(self connectionsByNode at: aNode) do: #removed.
	self connectionsByNode removeKey: aNode