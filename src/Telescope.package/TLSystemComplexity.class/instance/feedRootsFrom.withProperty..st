private
feedRootsFrom: anEntity withProperty: aProperty
	(self property value: anEntity)
		do: [ :anotherEntity | 
			roots addIfNotPresent: anotherEntity.
			self feedRootsFrom: anotherEntity withProperty: aProperty ]