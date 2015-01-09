running
setUp
	view := protocol mock: 'view'.
	connector := TLRoassal2Connector new.
	connector view: view.