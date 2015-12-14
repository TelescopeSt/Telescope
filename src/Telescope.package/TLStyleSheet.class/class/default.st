initialize-release
default
	| defaultStyleSheet |
	defaultStyleSheet := self new
		layout: (RTGridLayout new gapSize: 15);
		backgroundColor: (Color orange lighter alpha: 0.5);
		borderColor: Color black;
		textColor: Color black;
		borderWidth: 1;
		width: 15;
		height: 15;
		shape: TLRectangle;
		nodeLabelPosition: #inside;
		compositeExpandedByDefault: false;
		childrenLayout: RTGridLayout;
		triggerPosition: #right;
		yourself.
	defaultStyleSheet > #shapeInteraction
		backgroundColor: Color lightBlue;
		shape: TLEllipse;
		noNodeLabel;
		width: 8;
		height: 8.
	defaultStyleSheet > #connection
		connectionLabel: 'Toto';
		color: Color gray;
		width: 1.
	defaultStyleSheet > #connection > #head shape: TLTriangle.
	defaultStyleSheet > #connection > #middle shape: TLEllipse.
	defaultStyleSheet > #connection > #base shape: TLRectangle.
	defaultStyleSheet > #connection > #middleReversed shape: TLVee.
	^ defaultStyleSheet