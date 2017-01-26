as yet unclassified
new: id withError: anError on: aSocket
	self new
		visuId: id;
		errorObject: anError;
		sendCommandOn: aSocket.