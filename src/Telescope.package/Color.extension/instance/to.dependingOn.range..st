*Telescope-Style
to: aColor dependingOn: aBlockOrProperty range: aRange
	^ (self property: aBlockOrProperty gradientAt: aRange first) to: aColor at: aRange last