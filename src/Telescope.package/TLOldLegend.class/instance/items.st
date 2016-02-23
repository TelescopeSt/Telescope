accessing
items
	| items |
	items := Dictionary new.
	self contextBlock value allNodesDo: [ :aNode | items at: (self labelBlock value: aNode) put: (aNode backGroundColor rtValue: aNode entity) ].
	^ (items associations sorted: [ :a :b | a key < b key ])
		collect: [ :assoc | 
			TLLegendItem new
				title: assoc key;
				backgroundColor: assoc value;
				parent: self;
				yourself ]