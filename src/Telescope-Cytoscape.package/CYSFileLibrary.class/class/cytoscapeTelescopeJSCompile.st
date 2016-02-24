as yet unclassified
cytoscapeTelescopeJSCompile
	<script>
	self compile: 'cytoscapeTelescopeJs
	^ ''', (('cytoscapeTelescope.js' asFileReference contents) copyReplaceAll: '''' with: '''''')  ,''''