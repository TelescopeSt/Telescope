rendering
renderResetButtonOn: html
	html anchor
		onClick: 'telescope.visuWithId(' , self visuDivId asString , ').fit();';
		with: 'Reset'