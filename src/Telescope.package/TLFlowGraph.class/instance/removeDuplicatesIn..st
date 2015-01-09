accessing
removeDuplicatesIn: aCollection
	"Copy of an eyesee method; should be in Collection"
	| newCollection |
	newCollection := OrderedCollection new.
	aCollection
		do:
			[:each | (newCollection includes: each) ifFalse: [newCollection add: each]].
	^newCollection