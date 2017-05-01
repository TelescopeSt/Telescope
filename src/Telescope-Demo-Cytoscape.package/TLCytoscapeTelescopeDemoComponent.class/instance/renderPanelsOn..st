rendering
renderPanelsOn: html
	| panels |
	panels := OrderedDictionary with: 'demo' -> #renderDemoPanelOn: with: 'code' -> #renderCodePanelOn: with: 'debug' -> #renderDebugPanelOn:.
	html div
		id: 'telescope-panel__tabs';
		with: [ panels
				keysDo: [ :name | 
					html anchor
						url: '#tl' , name;
						class: 'tab';
						class: #isActive if: name = 'demo';
						with: name capitalized ] ].
	panels
		keysAndValuesDo: [ :name :meth | 
			html div
				id: 'tl' , name;
				class: #panel;
				class: #isActive if: name = 'demo';
				with: [ self perform: meth with: html ] ]