as yet unclassified
cytoscapeTelescopeJSCompile
	<script>
	self 
		compile:
			'cytoscapeTelescopeJs
	^ '''
				,
					('/Users/larcheveque/Projects/TelescopeOnWeb/cytoscapeTelescope.js' asFileReference contents
						copyReplaceAll: ''''
						with: '''''') , ''''