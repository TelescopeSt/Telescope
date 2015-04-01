versions
version10: spec
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'GuillaumeLarcheveque'.
		spec timestamp: '4/1/2015 13:25'.
		spec 
			package: #Trachel with: 'Trachel-akevalion.253';
			package: #Roassal2 with: 'Roassal2-AlexandreBergel.705'. ].
