as yet unclassified
visualizationWindowMenuOn: aBuilder
	<telescopeMenu>
	(aBuilder item: #'Export to PNG')
		action: [ :connector | 
					| fileName |
					fileName := UITheme builder fileSave: 'Enter the PNG file name' extensions: #('png') path: nil.
					fileName notNil
						ifTrue: [ 
							RTPNGExporter new
								builder: connector;
								fileName: fileName fullName;
								exportToFile ] ];
		icon: MooseIcons famixAttribute