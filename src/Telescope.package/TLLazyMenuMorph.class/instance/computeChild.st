as yet unclassified
computeChild
	self removeAllMorphs.
	self menuItems removeAll.
	self childBlock value
		ifEmpty: [ self
						add: 'empty'
						target: [ :entity | ]
						selector: #cull:
						argument: nil  ]
		ifNotEmptyDo: [ :children | 
			children
				do: [ :aChild | 
					self
						add: (self displayBlock value: aChild)
						target: [ :entity | self actionBlock value: entity ]
						selector: #cull:
						argument: aChild ] ]