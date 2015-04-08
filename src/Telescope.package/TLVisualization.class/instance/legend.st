accessing
legend
	legend ifNil: [ self legend: (TLStaticLegend new parent: self) ].
	^ legend