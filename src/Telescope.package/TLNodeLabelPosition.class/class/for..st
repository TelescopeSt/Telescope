as yet unclassified
for: aLabelOrPosition
	^ aLabelOrPosition class = self
		ifTrue: [ aLabelOrPosition ]
		ifFalse: [ self new perform: aLabelOrPosition ]