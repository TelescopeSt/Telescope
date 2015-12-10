demos
exampleFLowControl
	<script: 'self exampleFLowControl open'>

	| a b c d e f g visu |
	a := TLBasicBlock new title: 'a'.
	b := TLBasicBlock new title: 'b'.
	c := TLBasicBlock new title: 'c'.
	d := TLBasicBlock new title: 'd'.
	e := TLBasicBlock new title: 'e'.
	f := TLBasicBlock new title: 'f'.
	g := TLBasicBlock new title: 'g'.
	
	a next: { b. c . f }.
	b next: { d }.
	c next: { d. e }.
	d next: { g }.
	e next: { f }.
	f next: { g }.
	
	visu := TLFlowGraph new
		entryPoint: a;
		nextProperty: #next.
	visu addInteraction: TLNodeBasicInteraction draggable; addInteraction: (TLNodeBasicInteraction popup: #title).
	visu styleSheet nodeLabel: #title.
	 ^ visu