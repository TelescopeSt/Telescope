iterating
addStrategiesToBlock: aBlockClosure
	^ [ :anEntity | (aBlockClosure value: anEntity) and: [ self strategies allSatisfy: [ :aStrategy | aStrategy validate: anEntity ] ] ]