initialize-release
default
	^ self new
		nodeBuilder: TLNodeBuilder new;
		backgroundColor: Color orange;
		borderColor: Color black;
		borderWidth: 1;
		width: 15;
		height: 15;
		shape: TLRectangleShape new;
		childrenProperty: nil;
		yourself