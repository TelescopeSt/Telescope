*Telescope-Cytoscape
openOnWeb

	| webAppVisualization |
	self ensureWebAppVisualizationComponentIsRunning. 
	webAppVisualization := TLWebAppVisualization singleton.
	webAppVisualization visualization: self.
	
	UIManager default message: 'Open your prefered browser and go to localhost:8080/UserVisualization'.
	self flag: 'I am assuming that a server is already running on the port 8080. There should be a way to open the prefered browser at the right page'