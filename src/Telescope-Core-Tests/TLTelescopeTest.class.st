Class {
	#name : #TLTelescopeTest,
	#superclass : #TLWithTestConnectorTest,
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #helpers }
TLTelescopeTest >> demos [
	| falsePositives |
	falsePositives := #(#exampleTwoConnectedVisualization).
	^ TLDemos class methods select: [ :m | (m selector beginsWith: 'example') and: [ (falsePositives includes: m selector) not ] ]
]

{ #category : #helpers }
TLTelescopeTest >> packagesPrefix [
	^ 'Telescope'
]

{ #category : #helpers }
TLTelescopeTest >> telescopeTestClasses [
	^ (RPackageOrganizer default packages select: [ :e | e name beginsWith: self packagesPrefix ] thenCollect: [ :p | p definedClasses select: [ :class | class inheritsFrom: TestCase ] ]) flatten
]

{ #category : #tests }
TLTelescopeTest >> testAndMakeSureSuperSetupIsCalledAsFirstMessageInSetupMethodsOfTestCases [
	"Verify that each setUp method in a unit test starts with a call to super setUp as first message sent"

	| violating tester |
	self flag: #pharo6.
	SystemVersion current major < 7 ifTrue: [ self skip ].
	violating := OrderedCollection new.
	
	tester := self class environment classNamed: (SystemVersion current major < 9 ifTrue: [ #ShouldSendSuperSetUpAsFirstMessage ] ifFalse: [ #ReShouldSendSuperSetUpAsFirstMessage ]).
	self telescopeTestClasses
		do: [ :each | each compiledMethodAt: #setUp ifPresent: [ :method | (tester superSetUpNotCalledFirstIn: method) ifTrue: [ violating add: method ] ] ifAbsent: nil ].

	self assertEmpty: violating
]

{ #category : #tests }
TLTelescopeTest >> testAndMakeSureSuperTearDownIsCalledAsLastMessageInTearDownMethodsOfTestCases [
	"Verify that each tearDown method in a unit test ends with a call to super tearDown as last message sent"

	| violating tester |
	self flag: #pharo6.
	SystemVersion current major < 7 ifTrue: [ self skip ].
	violating := OrderedCollection new.

	tester := self class environment classNamed: (SystemVersion current major < 9 ifTrue: [ #ShouldSendSuperTearDownAsLastMessage ] ifFalse: [ #ReShouldSendSuperTearDownAsLastMessage ]).
	self telescopeTestClasses
		do: [ :each | each compiledMethodAt: #tearDown ifPresent: [ :method | (tester superTearDownNotCalledLastIn: method) ifTrue: [ violating add: method ] ] ifAbsent: nil ].

	self assertEmpty: violating
]

{ #category : #tests }
TLTelescopeTest >> testDemoHaveRightScriptPragmas [
	self demos
		do: [ :method | self assert: (method sourceCode includesSubstring: '<script: ''self ' , method selector , ' open''>') description: 'TLDemos class>>' , method selector , ' has no or wrong script pragma' ]
]

{ #category : #tests }
TLTelescopeTest >> testSmokeTestsOnDemos [
	self demos do: [ :demo | self shouldnt: [ TLDemos executeDemo: demo selector ] raise: Error description: 'TLDemo class>>' , demo selector , ' is failing.' ]
]
