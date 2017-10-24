instance-creation
callback: aBlock forElement: aString on: html
	| cbId |
	cbId := html callbacks
		store:
			(WAValueCallback
				on: [ :r | 
					html requestContext
						respond: [ :response | 
							| stream document |
							stream := response
								doNotCache;
								contentType: WAMimeType textHtml;
								stream.
							document := (WAHtmlDocument on: stream codec: GRNullCodec new)
								scriptGenerator: WADefaultScriptGenerator new;
								yourself.
							html context document: document.
							(WAHtmlCanvas context: html context)
								render: aBlock;
								flush.
							document scriptGenerator closeOn: document ] ]).
	^ self new
		url: html actionUrl asString , '&' , cbId asString;
		cssQuery: aString;
		yourself