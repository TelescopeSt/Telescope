execution
executeOnVisu: aTLVisualization
  'execute' crLog:self drawableId.
	aTLVisualization generator executeInteraction: self kind onDrawableId: self drawableId.