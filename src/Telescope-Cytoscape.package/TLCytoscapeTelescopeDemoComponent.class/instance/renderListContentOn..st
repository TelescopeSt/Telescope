rendering
renderListContentOn: html
	html
		unorderedList: [ self filteredMethods
				do: [ :each | 
					html listItem
						class: 'isSelected' if: self method = each selector;
						onClick:
							((html jQuery id: 'telescope-content') load
								html: [ :r | 
									self method: each selector.
									self renderMainContentOn: r ];
								onComplete: (JSStream on: 'initResizer();initTabs();$("pre > code").each(function(){hljs.highlightBlock(this);});telescope.loadVisuIn(document);'));
						with: (each selector allButFirst: 7) ] ]