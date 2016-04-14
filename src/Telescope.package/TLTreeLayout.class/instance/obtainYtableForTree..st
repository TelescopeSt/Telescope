private
obtainYtableForTree: tree
	| maxHeightByLevel pointer |
	maxHeightByLevel := OrderedCollection with: 0.
	self calculateMaxForLevel: 2 forTree: tree inTable: maxHeightByLevel.
	pointer := self levelGap negated.
	^ maxHeightByLevel collect: [ :yDec | pointer := pointer + yDec + self levelGap ]