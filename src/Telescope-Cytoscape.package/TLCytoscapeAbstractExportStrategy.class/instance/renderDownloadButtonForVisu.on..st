rendering
renderDownloadButtonForVisu: aVisuId on: html
	html image
		url: (CYSFileLibrary urlOf: self iconName);
		onClick: (self jsExportForVisu: aVisuId) js