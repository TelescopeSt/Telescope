testing
isConnectionDependant
	"For some optimisation we might want to know if our current layout depend on connections between nodes or not. For example the tree layout depend on connections between nodes but the linear layout doesn't depend on them. Thus my subclasses using connections in the layout should override this method."

	^ false