Extension { #name : #TestAsserter }

{ #category : #'*Telescope-Pharo8-Compatibility' }
TestAsserter >> assertEmpty: aCollection [
	^ self assert: aCollection isEmpty description: aCollection asString , ' should have been empty'
]
