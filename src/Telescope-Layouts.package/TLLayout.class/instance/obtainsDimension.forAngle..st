as yet unclassified
obtainsDimension: nodeDimension forAngle: anAngleInDegree
	"Here we have optimisation to avoid creating Rectangles if result is easy to determine"

	^ anAngleInDegree \\ 180 = 0
		ifTrue: [ nodeDimension ]
		ifFalse: [ 
			anAngleInDegree \\ 180 = 90
				ifTrue: [ nodeDimension y @ nodeDimension x ]
				ifFalse: [ 
					| rotatedPoints angleInRadians |
					angleInRadians := self angleInRadians: anAngleInDegree.
					rotatedPoints := {(0 @ nodeDimension y).
					(nodeDimension x @ 0).
					nodeDimension} collect: [ :point | point rotateBy: angleInRadians negated about: 0 @ 0 ].
					((rotatedPoints inject: 0 into: [ :value :point | point x max: value ])
						- (rotatedPoints inject: 0 into: [ :value :point | point x min: value ]))
						@
							((rotatedPoints inject: 0 into: [ :value :point | point y max: value ])
								- (rotatedPoints inject: 0 into: [ :value :point | point y min: value ])) ] ]