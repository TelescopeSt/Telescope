"
Description
--------------------

I am a class containing general stuff for Telescope such as a world menu entry for Telescope.
"
Class {
	#name : #Telescope,
	#superclass : #Object,
	#category : #'Telescope-Core-Utils'
}

{ #category : #'world menu' }
Telescope class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Telescope)
		order: 20;
		target: self;
		help: 'Options for Telescope'
]
