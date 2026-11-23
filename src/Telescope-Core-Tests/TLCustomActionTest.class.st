"
I test TLCustomAction: its block, its optional reverse block and how a TLMouseOverInteraction uses them, without a connector.
"
Class {
	#name : 'TLCustomActionTest',
	#superclass : 'TestCase',
	#category : 'Telescope-Core-Tests-Actions',
	#package : 'Telescope-Core-Tests',
	#tag : 'Actions'
}

{ #category : 'tests' }
TLCustomActionTest >> testActionBlockReceivesTheDrawable [

	| node received |
	node := TLSimpleNode new.
	(TLCustomAction block: [ :drawable | received := drawable ]) actionOn: node.
	self assert: received identicalTo: node
]

{ #category : 'tests' }
TLCustomActionTest >> testActionWithReverseBlockIsReversible [

	self assert: (TLCustomAction block: [ :drawable |  ] reverseBlock: [ :drawable |  ]) isReversible
]

{ #category : 'tests' }
TLCustomActionTest >> testActionWithoutReverseBlockIsNotReversible [

	self deny: (TLCustomAction block: [ :drawable |  ]) isReversible
]

{ #category : 'tests' }
TLCustomActionTest >> testMouseOverInteractionOfAPlainActionDoesNothingWhenTheMouseLeaves [

	| count node interaction |
	count := 0.
	node := TLSimpleNode new.
	interaction := (TLCustomAction block: [ :drawable | count := count + 1 ]) onMouseOver.
	interaction regularActionIfNecessaryOn: node.
	interaction reverseActionIfNecessaryOn: node.
	self assert: count equals: 1
]

{ #category : 'tests' }
TLCustomActionTest >> testMouseOverInteractionReversesItsAction [

	| events node interaction |
	events := OrderedCollection new.
	node := TLSimpleNode new.
	interaction := (TLCustomAction block: [ :drawable | events add: #regular ] reverseBlock: [ :drawable | events add: #reverse ]) onMouseOver.
	interaction regularActionIfNecessaryOn: node.
	interaction reverseActionIfNecessaryOn: node.
	self assert: events asArray equals: #( #regular #reverse )
]

{ #category : 'tests' }
TLCustomActionTest >> testReverseActionDoesNotEvaluateTheActionBlock [

	(TLCustomAction block: [ :drawable | self fail ] reverseBlock: [ :drawable |  ]) reverseActionOn: TLSimpleNode new
]

{ #category : 'tests' }
TLCustomActionTest >> testReverseActionEvaluatesTheReverseBlockWithTheDrawable [

	| node received action |
	node := TLSimpleNode new.
	action := TLCustomAction block: [ :drawable | self fail ] reverseBlock: [ :drawable | received := drawable ].
	action reverseActionIfNecessaryOn: node.
	self assert: received identicalTo: node
]

{ #category : 'tests' }
TLCustomActionTest >> testReverseActionWithoutReverseBlockDoesNothing [

	| action |
	action := TLCustomAction block: [ :drawable | self fail ].
	action reverseActionOn: TLSimpleNode new.
	action reverseActionIfNecessaryOn: TLSimpleNode new
]
