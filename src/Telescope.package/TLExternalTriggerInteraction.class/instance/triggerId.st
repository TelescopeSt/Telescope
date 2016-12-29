accessor
triggerId
	^ id ifNil:[ id:= TLExternalTriggerInteraction generateId ]