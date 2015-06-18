updating - interaction
updateInteractionsOf: aNode
	| element |
	element := self elementFromTLDrawable: aNode.
	self flag: 'Hack because Roassal do not expose api to remove methods'.
	element announcer subscriptions subscriptionsDo: [ :s | element announcer removeSubscription: s ].
	self menuInteractionByDrawable removeKey: aNode ifAbsent: [  ].
	self removeInteractionsOf: aNode.
	self generateInteractionsOf: aNode targetingDrawable: aNode