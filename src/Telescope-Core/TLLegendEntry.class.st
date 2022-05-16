"
I am an abstract class for legend entries. A legend entry is a part of the legend that describe one variable parameter.
"
Class {
	#name : #TLLegendEntry,
	#superclass : #TLDrawable,
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #testing }
TLLegendEntry class >> isAbstract [
	^ self = TLLegendEntry
]

{ #category : #style }
TLLegendEntry >> defaultStyle [
	^ #legendEntry
]

{ #category : #testing }
TLLegendEntry >> isStatic [
	^ false
]
