creation
from: aSymbolOrPosition
	^ aSymbolOrPosition class = self ifTrue: [ aSymbolOrPosition ] ifFalse: [ self new position: aSymbolOrPosition ]