accessing
title
	title ifNil: [ self title: ('Telescope ', self defaultTitle, ' Visualization') ].
	^ title