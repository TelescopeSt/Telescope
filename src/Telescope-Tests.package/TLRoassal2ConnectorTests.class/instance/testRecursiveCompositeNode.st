as yet unclassified
testRecursiveCompositeNode
	| visu   node childrenNode interaction |
	visu := TLVisualization new generator: connector.
	visu styleSheet
		childrenProperty: #dependentClasses;
		nodeLabel: #name;
		backgroundColor: Color white.
	visu styleSheet > #children
		childrenProperty: #subclasses;
		compositeExpandedByDefault: false;
		nodeLabel: #name;
		childrenLayout: RTVerticalLineLayout.
	node:=visu addNodeFromEntity: Collection.
	childrenNode := node childrenNodes second.
	interaction := node interactions first.
	protocol describe exactly: 34 times: view recv: #add:.
	protocol describe once: view recv: #addAll:.
	visu generate.	"collapse the parent node"
	protocol describe exactly: 32 times: view recv: #removeElement:.
	protocol describe once: view recv: #removeElement:.
	protocol describe once: view recv: #add:.
	protocol describe once: view recv: #signalUpdate.
	interaction actionOn: node.	"expand the parent node"
	protocol describe exactly: 32 times: view recv: #add:.
	protocol describe once: view recv: #removeElement:.
	protocol describe once: view recv: #add:.
	protocol describe once: view recv: #signalUpdate.
	interaction actionOn: node.	"expand a children node"
	protocol describe exactly: 1 times: view recv: #add:.
	protocol describe exactly: 1 times: view recv: #removeElement:.
	protocol describe once: view recv: #signalUpdate.
	interaction actionOn: childrenNode