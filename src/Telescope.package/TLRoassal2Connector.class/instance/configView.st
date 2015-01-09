private
configView
	| v |
	self flag: 'should not define draggable and zoomable but still here because not a good idea to define twice it if view is still draggable or zoomable'.
	v := RTView new.
	v @ RTDraggableView.
	v @ RTZoomableView.
	^ v