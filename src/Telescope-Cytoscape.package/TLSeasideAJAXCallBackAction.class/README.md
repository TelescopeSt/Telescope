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
