accessing
properties
	| block |
	block := [ :object | self titleToProperty valuesDo: [ :property | { property value: object } ] ].
	^ block