Class {
	#name : #TLWithTestConnectorTest,
	#superclass : #TestCase,
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #testing }
TLWithTestConnectorTest class >> isAbstract [
	^ self = TLWithTestConnectorTest
]

{ #category : #private }
TLWithTestConnectorTest >> performTest [
	TLCurrentConnector value: TLTestConnector during: [ super performTest ]
]
