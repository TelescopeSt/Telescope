accessing
legend
	legend ifNil: [ self legend: (TLLegend new parent: self) ].
	^ legend