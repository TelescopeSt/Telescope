demos
exampleButterflyUsingStyleFunctionnality
	<script: 'self exampleButterflyUsingStyleFunctionnality open'>
	<tlFilter: #style>
	<tlFilter: #visuTemplate>
	| butterfly |
	butterfly := TLButterfly new
		mainEntity: 10;
		leftEntities: [ :n | 1 to: n - 1 ];
		rightEntities: (15 to: 20).
	butterfly styleSheet
		shape: TLEllipse;
		width: 40;
		borderWidth: 0.5.
	(butterfly styleSheet > #redBackground)
		backgroundColor: Color red;
		textColor: Color red.
	butterfly > #left addStyle: #redBackground.
	^ butterfly