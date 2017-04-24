building
relativeSizeOf: aSize withMin: minOcc andMax: maxOcc
	^ ((self class maxLabelSize - self class minLabelSize) / ((maxOcc - minOcc) / aSize) + self class minLabelSize) asInteger