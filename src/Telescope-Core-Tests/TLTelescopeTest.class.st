Class {
	#name : 'TLTelescopeTest',
	#superclass : 'TLWithTestConnectorTest',
	#category : 'Telescope-Core-Tests-Model',
	#package : 'Telescope-Core-Tests',
	#tag : 'Model'
}

{ #category : 'helpers' }
TLTelescopeTest >> demos [
	| falsePositives |
	falsePositives := #(#exampleTwoConnectedVisualization).
	^ TLDemos class methods select: [ :m | (m selector beginsWith: 'example') and: [ (falsePositives includes: m selector) not ] ]
]

{ #category : 'tests' }
TLTelescopeTest >> testDemoHaveRightScriptPragmas [
	self demos
		do: [ :method | self assert: (method sourceCode includesSubstring: '<script: ''self ' , method selector , ' open''>') description: 'TLDemos class>>' , method selector , ' has no or wrong script pragma' ]
]

{ #category : 'tests' }
TLTelescopeTest >> testSmokeTestsOnDemos [
	self demos do: [ :demo | self shouldnt: [ TLDemos executeDemo: demo selector ] raise: Error description: 'TLDemo class>>' , demo selector , ' is failing.' ]
]
