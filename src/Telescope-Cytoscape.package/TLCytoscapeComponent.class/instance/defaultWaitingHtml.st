accessing
defaultWaitingHtml
	^ [ :html | 
	html div
		class: 'tlWaiting';
		with: [ 
					html image
						style: 'height: 50px; width: 50px;';
						url: (CYSFileLibrary urlOf: 'cog.gif').
					html heading
						level1;
						with: 'Please wait, loading in progress' ];
		yourself ]