initialize-release
default
	| defaultStyleSheet |
	defaultStyleSheet := self new
		layout: (TLLinearLayout gap: 15 maximumDimension: 300);
		backgroundColor: (Color orange lighter alpha: 0.5);
		borderColor: Color black;
		textColor: Color black;
		borderWidth: 1;
		width: 15;
		height: 15;
		shape: TLRectangle;
		nodeLabelPosition: #inside;
		compositeExpandedByDefault: false;
		childrenLayout: (TLLinearLayout gap: 5 maximumDimension: 50);
		takeAllSpace: false;
		triggerPosition: #right;
		yourself.
	defaultStyleSheet > #shapeInteraction
		backgroundColor: Color lightBlue;
		shape: TLEllipse;
		noNodeLabel;
		width: 8;
		height: 8.
	defaultStyleSheet > #connection
		color: Color gray;
		width: 1.
	defaultStyleSheet > #connection > #head shape: TLTriangle.
	
	^ defaultStyleSheet