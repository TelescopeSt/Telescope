hook
drawGraph: elements
	| rankedElements orderedElements positionByElement |
	rankedElements := self rankElements: elements.
	orderedElements := self orderElements: rankedElements.
	positionByElement := self positionForElement: orderedElements