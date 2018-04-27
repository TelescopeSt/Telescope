"
I am a strategy that will only accept lowest visibles elements (for a composite, if it is expanded its children will be accepted but not itself; if it is not expanded, it will be accepted)
"
Class {
	#name : #TLLowestVisibleStrategy,
	#superclass : #TLRequestStrategy,
	#category : 'Telescope-Model-Request'
}

{ #category : #optimisation }
TLLowestVisibleStrategy class >> ignoreVisibility [
	^ false
]

{ #category : #strategy }
TLLowestVisibleStrategy class >> validate: aDrawable [
	^ aDrawable isVisible
		and: [ 
			aDrawable isSimpleNode
				or: [ (aDrawable isCompositeNode and: [ aDrawable expanded not ]) or: [ aDrawable isGroup and: [ aDrawable isEmpty ] ] ] ]
]
