Class {
	#name : #TLTelescopeTest,
	#superclass : #TestCase,
	#category : #'Telescope-Core-Tests-Model'
}

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

	| violating |
	violating := OrderedCollection new.
	self telescopeTestClasses
		do: [ :each | each compiledMethodAt: #setUp ifPresent: [ :method | (ShouldSendSuperSetUpAsFirstMessage superSetUpNotCalledFirstIn: method) ifTrue: [ violating add: method ] ] ifAbsent: nil ].

	self assertEmpty: violating
]

{ #category : #tests }
TLTelescopeTest >> testAndMakeSureSuperTearDownIsCalledAsLastMessageInTearDownMethodsOfTestCases [
	"Verify that each tearDown method in a unit test ends with a call to super tearDown as last message sent"

	| violating |
	violating := OrderedCollection new.
	self telescopeTestClasses
		do: [ :each | each compiledMethodAt: #tearDown ifPresent: [ :method | (ShouldSendSuperTearDownAsLastMessage superTearDownNotCalledLastIn: method) ifTrue: [ violating add: method ] ] ifAbsent: nil ].

	self assertEmpty: violating
]
