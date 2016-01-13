public
availablePlacing
	^ self methods select: [ :m | m protocol =#placing ] thenCollect: #selector