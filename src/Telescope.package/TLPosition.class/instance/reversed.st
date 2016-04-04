helper
reversed
	| opposed |
	self flag: 'Optimisation: do not create this dictionary each time'.
	opposed := {(#left -> #right).
	(#center -> #center).
	(#top -> #bottom)} asDictionary.
	opposed keysAndValuesDo: [ :key :value | opposed at: value put: key ].
	^ self class new
		horizontal: (opposed at: self horizontal);
		vertical: (opposed at: self vertical);
		yourself