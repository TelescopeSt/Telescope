tests
testCytoscapePolygonPointsFrom
	self
		assert:
			(self actualClass
				cytoscapePolygonPointsFrom:
					{(-1 @ 1).
					(0.3 @ 1).
					(1 @ 0.3).
					(1 @ -1).
					(-1 @ -1)})
		equals: '-1, -1, 0.3, -1, 1, -0.3, 1, 1, -1, 1'.
	self
		assert:
			(self actualClass
				cytoscapePolygonPointsFrom:
					{(-1 @ 0.75).
					(-0.8 @ 1).
					(-0.3 @ 1).
					(-0.1 @ 0.75).
					(1 @ 0.75).
					(1 @ -1).
					(-1 @ -1)})
		equals: '-1, -0.75, -0.8, -1, -0.3, -1, -0.1, -0.75, 1, -0.75, 1, 1, -1, 1'