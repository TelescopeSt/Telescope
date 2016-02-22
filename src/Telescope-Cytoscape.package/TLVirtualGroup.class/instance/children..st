accessing
children: aChildren
	"If it is a node there is a problem. We should come here from #addAll of another group"
	self assert: aChildren isGroup