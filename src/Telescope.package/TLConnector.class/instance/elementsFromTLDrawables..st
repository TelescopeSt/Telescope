as yet unclassified
elementsFromTLDrawables: aGroupOfNodes
	^ aGroupOfNodes collect: [ :node | self elementFromTLDrawable: node ]