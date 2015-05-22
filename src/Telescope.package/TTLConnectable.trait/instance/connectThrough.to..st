connect
connectThrough: connectionsValuable to: targetValuable
	"Specify how nodes are connected. ==connectionsValuable== is a 1-arg block (or symbol) that must return a collection of the model's connection entities for a given model's node. ==targetValuable== is a 1-arg block (or symbol) that must return the target model's node for a given model's connection entity. The idea is that ==targetValuable== will be evaluated for each element returned by the evaluation of ==connectionsValuable==."
	^ self connectThrough: connectionsValuable to: targetValuable context: self