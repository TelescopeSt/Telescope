Extension { #name : #Color }

{ #category : #'*Telescope-Cytoscape' }
Color >> forCytoscape [
	^ String
		streamContents: [ :s | 
			s
				<< 'rgba(';
				<< (self red * 255) asInteger;
				<< $,;
				<< (self green * 255) asInteger;
				<< $,;
				<< (self blue * 255) asInteger;
				<< $,;
				<< self alpha asString;
				<< $) ]
]
