instance creation
on: aBlockReturningDrawableCollection label: aBlockReturningLabelFromNode
	"aBlockReturningDrawableCollection is a block without arguments"
	"aBlockReturningLabelFromNode is a block taking a Node and returning the label associated"
	self contextBlock: aBlockReturningDrawableCollection.
	self labelBlock: aBlockReturningLabelFromNode 