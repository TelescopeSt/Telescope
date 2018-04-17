rendering
renderOptionalButtonsOn: html
	html div
		class: 'fitButton';
		with: [ self renderResetButtonOn: html.
			self renderDownloadButtonOn: html ]