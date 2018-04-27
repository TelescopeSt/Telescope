Extension { #name : #SystemWindow }

{ #category : #'*Telescope' }
SystemWindow >> menuPragmaNamed: aPragmaName model: aModel [
	menuBuilder := PragmaMenuBuilder pragmaKeyword: aPragmaName model: aModel
]
