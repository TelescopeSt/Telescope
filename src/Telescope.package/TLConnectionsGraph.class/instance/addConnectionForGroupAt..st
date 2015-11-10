private
addConnectionForGroupAt: aLevel
	(self > aLevel) nodes
		do: [ :aNode | 
			(levelsCollection flatten select: [ :each | (aNode entity perform: self connectionProperty) includes: each ])
				do: [ :anEntity | 
					self edgeDirection = #incoming
						ifTrue: [ 
							[ aNode connectTo: (self nodeForEntity: anEntity) ]
								on: NotFound
								do: [  ] ]
						ifFalse: [ 
							[ (self nodeForEntity: anEntity) connectTo: aNode ]
								on: NotFound
								do: [  ] ] ] ]