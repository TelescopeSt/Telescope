"
I am an abstract class for legend entries. A legend entry is a part of the legend that describe one variable parameter.
"
Class {
	#name : #TLLegendEntry,
	#superclass : #TLDrawable,
	#category : 'Telescope-Model-Legend'
}

{ #category : #style }
TLLegendEntry >> defaultStyle [
	^ #legendEntry
]

{ #category : #testing }
TLLegendEntry >> isStatic [
	^ false
]
