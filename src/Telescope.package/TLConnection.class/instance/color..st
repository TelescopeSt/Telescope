accessing
color: aColorOrBlock
	self
		deprecated:
			'CyrilFerlicot - 22/04/2017: Style should be managed via the stylesheet. Use `connection styleSheet color: aColor` instead.'.
	self styleSheet backgroundColor: aColorOrBlock