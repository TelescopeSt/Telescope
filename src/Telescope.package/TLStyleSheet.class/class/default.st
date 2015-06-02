initialize-release
default
	| defaultStyleSheet |
	defaultStyleSheet := self new
		layout: RTGridLayout;
		backgroundColor: Color orange;
		borderColor: Color black;
		textColor: Color black;
		borderWidth: 1;
		width: 15;
		height: 15;
		shape: TLRectangle;
		nodeLabelPosition: #inside;
		childrenProperty: nil;
		childrenLayout: RTGridLayout;
		yourself.	"Centered"
	defaultStyleSheet > #children nodeClass: TLSimpleNode.
	^ defaultStyleSheet