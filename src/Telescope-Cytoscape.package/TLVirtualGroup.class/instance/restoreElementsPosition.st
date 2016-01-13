as yet unclassified
restoreElementsPosition
	"Used because Roassal only translate nodes and do not set their position"
	self do: [ :anElement | anElement position: 0@0 ]