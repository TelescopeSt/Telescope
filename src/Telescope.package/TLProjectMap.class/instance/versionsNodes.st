accessing
versionsNodes
	"This is currently a hack. Ideally we should just use #withDeepCollect: [ … ] as: Set. The problem is that, for now, the MetacelloVersion takes only the versionNumber into account and not the project name. If two different project has the same version number, we will lose one. Maybe in the future we will be able to make this code simpler. See: https://github.com/dalehenrich/metacello-work/issues/437"

	^ (version withDeepCollect: [ :each | each projects collect: #version ])
		inject: OrderedCollection new
		into: [ :coll :vers | 
			coll detect: [ :each | each versionNumber = vers versionNumber and: [ each projectLabel = vers projectLabel ] ] ifNone: [ coll add: vers ].
			coll ]