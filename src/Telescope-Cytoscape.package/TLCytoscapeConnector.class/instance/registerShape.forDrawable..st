accessing
registerShape: element forDrawable: aDrawable
	super registerShape: element forDrawable: aDrawable.
	[self drawablesById at: element id put: aDrawable] on: MessageNotUnderstood do: [  ]