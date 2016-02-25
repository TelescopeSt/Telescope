accessing
elementsFromTLDrawables: aGroupOfNodes
	^ aGroupOfNodes collect: [ :node | self elementFromTLDrawable: node ]