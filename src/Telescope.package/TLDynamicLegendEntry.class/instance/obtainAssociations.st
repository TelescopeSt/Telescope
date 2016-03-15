resolution
obtainAssociations
	^ (self contextBlock value groupedBy: [ :drawable | self descriptionBlock value: drawable entity ]).
	 
