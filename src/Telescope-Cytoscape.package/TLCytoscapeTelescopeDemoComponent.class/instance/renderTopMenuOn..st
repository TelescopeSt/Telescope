rendering
renderTopMenuOn: html
	html div
		class: 'top-menu';
		with: [ 
					html anchor
						url: '#demo';
						with: 'Demo'.
					html anchor
						url: '#code';
						with: 'Code'.
					html anchor
						url: '#debug';
						with: 'Debug visu' ]