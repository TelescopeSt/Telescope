as yet unclassified
sortBlock
	^ [ :a :b | state ifTrue: [ a < b ] ifFalse: [ a > b ] ]