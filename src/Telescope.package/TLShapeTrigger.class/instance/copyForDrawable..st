copying
copyForDrawable: aTLDrawable 
	"We have to copy the trigger for each drawable where it will be applied"
	^ self copy referencedElement: aTLDrawable; yourself