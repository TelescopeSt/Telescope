instance-creation
for: aLabelOrPosition
	^ aLabelOrPosition class = self
		ifTrue: [ aLabelOrPosition ]
		ifFalse: [ self new perform: aLabelOrPosition ]