Class {
	#name : 'TLWithTestConnectorTest',
	#superclass : 'TestCase',
	#category : 'Telescope-Core-Tests-Model',
	#package : 'Telescope-Core-Tests',
	#tag : 'Model'
}

{ #category : 'testing' }
TLWithTestConnectorTest class >> isAbstract [
	^ self = TLWithTestConnectorTest
]

{ #category : 'private' }
TLWithTestConnectorTest >> performTest [
	TLCurrentConnector value: TLTestConnector during: [ super performTest ]
]
