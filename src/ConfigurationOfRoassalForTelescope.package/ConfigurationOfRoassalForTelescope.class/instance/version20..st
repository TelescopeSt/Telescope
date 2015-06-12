versions
version20: spec
	<version: '2.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'version 2.0 for Moose 5.1'.
		spec author: 'NicolasAnquetil'.
		spec timestamp: '06/12/2015'.
		spec 
			package: #Trachel with: 'Trachel-akevalion.287';
			package: #Roassal2 with: 'Roassal2-AlexandreBergel.913'. ].
