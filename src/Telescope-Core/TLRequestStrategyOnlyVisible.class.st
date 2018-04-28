"
I am a strategy that will restrain the request result to the visible elements in the visualization
"
Class {
	#name : #TLRequestStrategyOnlyVisible,
	#superclass : #TLRequestStrategy,
	#category : #'Telescope-Core-Model-Request'
}

{ #category : #optimisation }
TLRequestStrategyOnlyVisible class >> ignoreVisibility [
	^ false
]

{ #category : #strategy }
TLRequestStrategyOnlyVisible class >> validate: aDrawable [
	^ aDrawable isVisible
]
