accessing
message
	^ message ifNil:[ self errorObject messageText ]