accessing
scale
	"Optional option to define the scale of the export. Should be a positive number. By default: 1."
	
	^ scale ifNil: [ scale := 1 ]