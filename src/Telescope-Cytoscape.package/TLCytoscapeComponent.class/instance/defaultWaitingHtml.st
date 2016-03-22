accessing
defaultWaitingHtml
	^ [ :html | 
	html div
		class: 'tlWaiting';
		with: [ 
					html heading
						level1;
						with: 'Please wait, loading in progress' ];
		yourself ]