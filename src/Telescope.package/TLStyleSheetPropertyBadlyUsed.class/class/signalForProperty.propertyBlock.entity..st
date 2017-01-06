signalling
signalForProperty: aPropertyOrValuable propertyBlock: result entity: anEntity
	^ self new
		property: aPropertyOrValuable;
		propertyBlock: result;
		entity: anEntity;
		signal