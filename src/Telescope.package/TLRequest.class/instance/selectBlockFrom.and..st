private
selectBlockFrom: aBlockClosure and: aTypeBlock
	^ [ :drawable | (aTypeBlock cull: drawable) and: [ aBlockClosure cull: drawable ] ]