outsideRegistration
registerConnection: aTLConnection forNode: aTLNode
	"Use me if you want to manually connect something and simulate this action has created it. Consequently, the revert will remove also this connection"

	(self connectionsByNode at: aTLNode) add: aTLConnection