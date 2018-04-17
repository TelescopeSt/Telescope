rendering
renderDownloadButtonOn: html
	self addDownloadButton ifFalse: [ ^ self ].
	
	html image
		url: (CYSFileLibrary urlOf: 'downloadPng');
		onClick: 'Telescope.download("' , DateAndTime now printString , '.png", telescope.visuWithId(' , self visuDivId asString , ').png({full:true}));'