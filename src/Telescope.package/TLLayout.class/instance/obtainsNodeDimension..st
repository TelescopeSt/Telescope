node facade
obtainsNodeDimension: aNode
	| nodeDimension |
	nodeDimension := aNode dimension.	"Here we have optimisation to avoid creating Rectangles if result is easy to determine"
	^ self angle \\ 180 = 0
		ifTrue: [ nodeDimension ]
		ifFalse: [ 
			self angle \\ 180 = 90
				ifTrue: [ nodeDimension y @ nodeDimension x ]
				ifFalse: [ 
					| rotatedPoints |
					rotatedPoints := {(0 @ nodeDimension y).
					(nodeDimension x @ 0).
					nodeDimension} collect: [ :point | point rotateBy: self angleInRadian negated about: 0 @ 0 ].
					((rotatedPoints inject: 0 into: [ :value :point | point x max: value ])
						- (rotatedPoints inject: 0 into: [ :value :point | point x min: value ]))
						@
							((rotatedPoints inject: 0 into: [ :value :point | point y max: value ])
								- (rotatedPoints inject: 0 into: [ :value :point | point y min: value ])) ] ]