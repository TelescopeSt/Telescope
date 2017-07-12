as yet unclassified
callback: cbId forElement: aString on: html
	^self new 
	 url: html actionUrl asString , '&' , cbId asString;
	 cssQuery: aString;
	yourself.