as yet unclassified
percentageForLevel: aLevel
	| low high |
	low := self levelForColors first key.
	high := self levelForColors last key.
	^ (aLevel - low) / (high - low)