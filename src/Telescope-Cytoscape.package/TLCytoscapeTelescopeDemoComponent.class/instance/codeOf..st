as yet unclassified
codeOf: aSymbol
	"I take a method selector I contains and return his source code without the declaration."

	^ String
		streamContents: [ :stream | 
			((TLDemos class sourceCodeAt: aSymbol) lines allButFirst: 2)
				do: [ :ea | stream nextPutAll: ea ]
				separatedBy: [ stream nextPutAll: GRPlatform current newline ] ]