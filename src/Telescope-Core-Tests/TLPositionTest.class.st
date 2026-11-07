Class {
	#name : 'TLPositionTest',
	#superclass : 'TestCase',
	#category : 'Telescope-Core-Tests',
	#package : 'Telescope-Core-Tests'
}

{ #category : 'tests' }
TLPositionTest >> testReversedDoesNotChangeThePosition [

	| position |
	position := TLPosition new
		            horizontal: #left;
		            vertical: #top;
		            yourself.
	position reversed.
	self assert: position horizontal equals: #left.
	self assert: position vertical equals: #top
]

{ #category : 'tests' }
TLPositionTest >> testReversedIsTheOppositePositionOnBothAxes [

	| opposites |
	opposites := {
		             (#left -> #right).
		             (#center -> #center).
		             (#right -> #left) } asDictionary.
	#( #top #center #bottom ) do: [ :vertical |
			#( #left #center #right ) do: [ :horizontal |
					| reversed |
					reversed := (TLPosition new
						             horizontal: horizontal;
						             vertical: vertical;
						             yourself) reversed.
					self assert: reversed horizontal equals: (opposites at: horizontal).
					self assert: reversed vertical equals: ({
							 (#top -> #bottom).
							 (#center -> #center).
							 (#bottom -> #top) } asDictionary at: vertical) ] ]
]
