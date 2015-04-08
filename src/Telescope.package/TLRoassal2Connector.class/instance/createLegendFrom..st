generation - legend
createLegendFrom: legendItems
	| background legend |
	legendItems ifEmpty: [ ^#() ].
	background := RTBox new color: Color white; borderColor: Color black; element.
	legend := RTGroup newFrom: legendItems.
	RTNest new layout: (RTVerticalLineLayout new alignRight);
		on: background nest: legend.
	background setAsFixed.
	background translateTo: ((background width/2 + 5)@(background height/2 + 5)).
	^ (RTGroup with: background with: legend)