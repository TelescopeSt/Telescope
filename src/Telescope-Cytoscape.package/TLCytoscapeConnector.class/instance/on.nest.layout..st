nesting
on: compositeElement nest: innerElements layout: layout
	layout on: innerElements.
	innerElements do: [ :anInnerElement | anInnerElement parent: compositeElement ]