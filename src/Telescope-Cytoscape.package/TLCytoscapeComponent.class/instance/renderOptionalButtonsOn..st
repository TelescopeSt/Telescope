rendering
renderOptionalButtonsOn: html
	html div
		class: 'fitButton';
		with: [ self renderResetButtonOn: html.
			self exportStrategy renderDownloadButtonForVisu: self visuDivId on: html ]