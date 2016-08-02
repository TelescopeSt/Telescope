as yet unclassified
obtainRatioBySimulatingLayout: aLayout on: aGroup
	| simulator |
	simulator := TLLinearLayoutSimulator new
		horizontalGap: aLayout horizontalGap;
		verticalGap: aLayout verticalGap;
		newLineStrategy: self;
		yourself.
	simulator executeOn: aGroup.
	^ simulator ratio