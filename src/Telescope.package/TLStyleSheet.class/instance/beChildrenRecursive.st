children
beChildrenRecursive
	"Be careful by combining this with #compositeExpandedByDefault because it can creates infinite loops"
	self substyles at: #children put: self.