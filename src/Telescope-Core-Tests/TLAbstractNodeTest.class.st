Class {
	#name : #TLAbstractNodeTest,
	#superclass : #TestCase,
	#instVars : [
		'node'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLAbstractNodeTest >> setUp [
	super setUp.
	node := TLAbstractNode new
]

{ #category : #tests }
TLAbstractNodeTest >> testNotDuplicateAdjacentNodes [
   | in inOut out adjacents |
   in:= TLAbstractNode withEntity: 'in'.
   inOut:= TLAbstractNode withEntity: 'inOut'.
   out:= TLAbstractNode withEntity: 'out'.
   TLConnection from: in to: node visualization: nil.
   TLConnection from: inOut to: node visualization: nil.
   TLConnection from: node to: inOut visualization: nil.
   TLConnection from: node to: out visualization: nil.
	adjacents:= node adjacentNodes.
	self assert: adjacents size equals: 3
]
