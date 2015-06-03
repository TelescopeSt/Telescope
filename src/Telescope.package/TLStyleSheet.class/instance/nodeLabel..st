label
nodeLabel: aNodeLabelValuable
	"doing that because #rtValue: is stupid with Classes"
	self
		at: #nodeLabel
		put:
			(aNodeLabelValuable isSymbol
				ifTrue: [ [ :entity | entity perform: aNodeLabelValuable ] ]
				ifFalse: [ aNodeLabelValuable ])