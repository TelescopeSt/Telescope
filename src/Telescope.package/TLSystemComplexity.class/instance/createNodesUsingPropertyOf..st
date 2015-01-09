private
createNodesUsingPropertyOf: anEntity
	| children |
	children := self property value: anEntity.
	self > #default addNodesFromEntities: children.
	children do: [ :child | self createNodesUsingPropertyOf: child ] 