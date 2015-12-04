as yet unclassified
cytoscapeTelescopeJSCompile
	<script>
	self class compile: 'cytoscapeTelescopeJS
	^ ''', (('/Users/larcheveque/Projects/TelescopeOnWeb/cytoscapeTelescope.js' asFileReference contents) copyReplaceAll: '''' with: '''''')  ,''''