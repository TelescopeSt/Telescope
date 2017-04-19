rendering
renderCodePanelOn: html
	html preformatted
		id: #code;
		style: 'width: 100%;';
		with: [ html code
				class: 'smalltalk';
				with: (self codeOf: (self method ifNotNil: [ :m | TLDemos class >> m asSymbol ] ifNil: [ self class >> #defaultDemo ])) ]