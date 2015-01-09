as yet unclassified
testRecursiveCompositeNode
	| visu nodeBuilder childrenNodeBuilder node childrenNode interaction |
	childrenNodeBuilder := TLCompositeNodeBuilder childrenProperty: #subclasses.
	childrenNodeBuilder expandedByDefault: false.
	childrenNodeBuilder nodeLabel: #name.
	childrenNodeBuilder childrenLayout: RTVerticalLineLayout.
	
	nodeBuilder := TLCompositeNodeBuilder childrenProperty: #dependentClasses.
	nodeBuilder nodeLabel: #name.
	nodeBuilder backgroundColor: Color white.
	nodeBuilder childrenNodeBuilder: childrenNodeBuilder.
	
	node := nodeBuilder buildNodeFromEntity: Collection.
	childrenNode := node childrenNodes telescopeEntities second.
	interaction := node interactions first.
	
	visu := TLVisualization new generator: connector.
	visu addDrawable: node.
	
	protocol describe exactly: 34 times: view recv: #add:.
	protocol describe once: view recv: #addAll:.
	visu generate.
	
	"collapse the parent node"
	protocol describe exactly: 32 times: view recv: #removeElement:.
	protocol describe once: view recv: #removeElement:.
	protocol describe once: view recv: #add:.
	protocol describe once: view recv: #signalUpdate.
	interaction actionOn: node.
	
	"expand the parent node"
	protocol describe exactly: 32 times: view recv: #add:.
	protocol describe once: view recv: #removeElement:.
	protocol describe once: view recv: #add:.
	protocol describe once: view recv: #signalUpdate.
	interaction actionOn: node.
	
	"expand a children node"
	protocol describe exactly: 1 times: view recv: #add:.
	protocol describe exactly: 1 times: view recv: #removeElement:.
	protocol describe once: view recv: #signalUpdate.
	interaction actionOn: childrenNode