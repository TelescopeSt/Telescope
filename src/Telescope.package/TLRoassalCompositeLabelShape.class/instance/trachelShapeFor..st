public
trachelShapeFor: anElement
	| lsh nsh c |

	nsh := self shape trachelShapeFor: anElement.
	lsh := self labelShape trachelShapeFor: anElement.

	(self labelPosition value: self) value: nsh value: lsh.
	c := TRCompositeShape new addShape: nsh ; addShape: lsh ; yourself.
	^ c

	"| c |
	c := super trachelShapeFor: anElement.
	(self labelPosition value: self) value: c shapes first value: c shapes second.
	^ c"