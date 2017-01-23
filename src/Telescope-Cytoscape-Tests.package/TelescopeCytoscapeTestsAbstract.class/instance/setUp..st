running
setUp: html
	self wait: 'telescope.onMessageEnd(function(){telescope.removeMessageEnd(this);console.log("mocha run after message telescope"); mocha.run()})'.
	self crLog: testSelector .
	html render: ((TLCytoscapeComponent visualization: self visualization) style: 'height: 500px; width:800px;')