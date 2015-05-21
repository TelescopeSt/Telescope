accessing
shape
	^ [(self get: #shape) label: self nodeLabel] on: NotFound do: [self get: #shape]