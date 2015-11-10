private
nextLevelNodes: aCollection atLevel: aLevel
	^ [(levelsCollection at: aLevel + 1)] on: SubscriptOutOfBounds do: [ #() ]