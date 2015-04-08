updating - legend
updateLegend: aTLLegend
	| legend background |
	aTLLegend isUpdateRequired
		ifTrue: [ 
			[ 
			legend := self shapeByDrawable at: aTLLegend.
			legend ifNotEmpty: [ 
							legend second do: #remove.
			legend remove: legend second.
			background := legend add: (RTGroup newFrom: (aTLLegend items collect: [ :item | item generateWith: self ])).
			RTNest new
				layout: RTVerticalLineLayout new alignRight;
				on: legend first nest: legend second.
			legend translateTo: (background width / 2 + 10) @ (background height / 2 + 10) ]]
				on: KeyNotFound
				do: [ self flag: 'Should not happen' ].
			aTLLegend updateDone ]