instance creation
new: id withMessage: anError on: aSocket
	self new
		visuId: id;
		message: anError;
		sendCommandOn: aSocket.