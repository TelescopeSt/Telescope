action
reverseActionOn: aNode
	(self connectionsByNode removeKey: aNode) do: #removed