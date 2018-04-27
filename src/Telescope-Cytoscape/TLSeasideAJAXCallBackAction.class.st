"
Description
--------------------

I am an action allowing to modify an HTML page managed by Seaside via Ajax.

This is intersting when we need to refresh a part of the page after an interaction.

Public API and Key Messages
--------------------

- class>>#callback: aBlock forElement: aString on: html  		Constructor of the action. It take a block to execute, a css query to find the element to replace and an html canvas
- beforeBlock: aBlock										A block taking the drawable and entity as parameter. This is executed before the execution of the callback.

Examples
--------------------

	visualisation 
		addInteraction: ((TLSeasideAJAXCallBackAction callback: [ self renderElementToRefreshOn: html ] forElement: '#the-id-of-my-element' on: html)
							beforeBlock: [ :node :entity | self entityClicked: entity ];
							onClick)  propagateToChildren
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	beforeBlock:		<aBlock>	A block to execute before the execution of the callback. It take the drawable and the entity receiving the action as parameter.
	cssQuery:		<aString>	A string representing a css query. This string should allow to find the element to refresh on the page. (Use for example classes or ids to localise the element)
	url:				<aString>	The url of the callback

"
Class {
	#name : #TLSeasideAJAXCallBackAction,
	#superclass : #TLDrawableAction,
	#instVars : [
		'cssQuery',
		'url',
		'beforeBlock'
	],
	#category : 'Telescope-Cytoscape-Actions'
}

{ #category : #'instance-creation' }
TLSeasideAJAXCallBackAction class >> callback: aBlock forElement: aString on: html [
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
]

{ #category : #action }
TLSeasideAJAXCallBackAction >> actionOn: aTLDrawable [
  self beforeBlock ifNotNil: [ self beforeBlock cull: aTLDrawable cull: aTLDrawable entity ].
  aTLDrawable generator executeAJAXCallBack: self url onDrawable: aTLDrawable  onElement: self cssQuery 
]

{ #category : #accessing }
TLSeasideAJAXCallBackAction >> beforeBlock [
	^ beforeBlock
]

{ #category : #accessing }
TLSeasideAJAXCallBackAction >> beforeBlock: anObject [
	beforeBlock := anObject
]

{ #category : #accessing }
TLSeasideAJAXCallBackAction >> cssQuery [
	^ cssQuery
]

{ #category : #accessing }
TLSeasideAJAXCallBackAction >> cssQuery: anObject [
	cssQuery := anObject
]

{ #category : #accessing }
TLSeasideAJAXCallBackAction >> url [
	^ url
]

{ #category : #accessing }
TLSeasideAJAXCallBackAction >> url: anObject [
	url := anObject
]
