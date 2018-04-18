rendering
renderDownloadButtonForVisu: aVisuId on: html
	self strategies do: [ :each | each renderDownloadButtonForVisu: aVisuId on: html ]