accessing
filteredMethods
	^ (self filters
		inject: Set new
		into: [ :res :filterClass | 
			res addAll: ((PragmaCollector new filter: [ :prg | prg keyword = 'tlFilter:' and: [ (prg argumentAt: 1) = filterClass filterSymbol ] ]) reset collect: #method).
			res ]) sorted: [ :a :b | a selector < b selector ]