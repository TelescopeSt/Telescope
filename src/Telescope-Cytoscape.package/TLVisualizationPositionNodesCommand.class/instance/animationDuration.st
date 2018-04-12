accessing
animationDuration
	self nodes ifEmpty: [ ^ 0 ].
	
	(self visualization hasBeenGenerated or: [ self animateLayoutApplicationDuringGeneration ]) ifFalse: [ ^ 0 ].
	
	^ self defaultAnimationDuration