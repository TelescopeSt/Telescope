compute
computeForLevel: aLevel
	| min max |
	min := self levelForColors reverse detect: [ :levelWithColor | levelWithColor key <= aLevel ] ifNone: [ nil ].
	max := self levelForColors detect: [ :levelWithColor | levelWithColor key >= aLevel ] ifNone: [ nil ].
	min ifNil: [ ^ max value ].
	max ifNil: [ ^ min value ].
	min = max ifTrue: [ ^ min value ].
	^ max value alphaMixed: (aLevel - min key) / (max key - min key) with: min value