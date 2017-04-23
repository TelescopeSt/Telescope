demos
exampleFLowControl
	<script: 'self exampleFLowControl open'>
	<tlFilter: #visuTemplate>

	| a b c d e f g visu |
	a := TLBasicBlock title: 'a'.
	b := TLBasicBlock title: 'b'.
	c := TLBasicBlock title: 'c'.
	d := TLBasicBlock title: 'd'.
	e := TLBasicBlock title: 'e'.
	f := TLBasicBlock title: 'f'.
	g := TLBasicBlock title: 'g'.
	
	a next: { b. c . f }.
	b next: { d }.
	c next: { d. e }.
	d next: { g }.
	e next: { f }.
	f next: { g }.
	
	visu := TLFlowGraph new
		entryPoint: a;
		nextProperty: #next.
	visu addInteraction: (TLPopUpAction text: #title) onMouseOver.
	visu styleSheet nodeLabel: #title.
	 ^ visu