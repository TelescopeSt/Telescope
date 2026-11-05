"
A TLStar is an enum value for a Star.

"
Class {
	#name : 'TLStar',
	#superclass : 'TLSimpleShape',
	#category : 'Telescope-Core-Shape',
	#package : 'Telescope-Core',
	#tag : 'Shape'
}

{ #category : 'instance creation' }
TLStar class >> polygonPoints [
	"A star with five branches, alternating the points of the branches and the inner points, stretched so that it touches the sides of the [-1, 1] box"

	| points maximumX minimumY |
	points := (0 to: 9) collect: [ :index |
			          | radius angle |
			          radius := index even
				                    ifTrue: [ 1 ]
				                    ifFalse: [ 0.381966 ].
			          angle := Float pi / 2 + (index * Float pi / 5).
			          radius * angle cos @ (radius * angle sin) ].
	maximumX := (points collect: [ :point | point x abs ]) max.
	minimumY := (points collect: [ :point | point y ]) min.
	^ points collect: [ :point | point x / maximumX @ (point y - minimumY / (1 - minimumY) * 2 - 1) ]
]
