Class {
	#name : #TLSortingStrategiesTests,
	#superclass : #TestCase,
	#instVars : [
		'strategy',
		'group',
		'order'
	],
	#category : #'Telescope-Core-Tests-Strategy'
}

{ #category : #running }
TLSortingStrategiesTests >> setUp [
	order := #(4 8 3 9 5 2 7 1 6 10).
	group := TLEntitiesGroup new
		addAllDrawables:
			(order
				collect: [ :i | 
					TLSimpleNode new
						entity: i;
						yourself ]).
]

{ #category : #tests }
TLSortingStrategiesTests >> testComparableUsingStrategyAddNewElementAtTheEnd [
	group sortingStrategy: TLComparableUsingStrategy new.
	group addDrawable: (TLSimpleNode new entity: 6).
	self assert: (group collect: #entity) asArray equals: #(1 2 3 4 5 6 6 7 8 9 10)
]

{ #category : #tests }
TLSortingStrategiesTests >> testComparableUsingStrategySortCorrectly [
	strategy := TLComparableUsingStrategy new.
	self assert: (group collect: #entity) asArray equals: order.
	strategy sortNodes: group.
	self assert: (group collect: #entity) asArray equals: (1 to: 10) asArray
]

{ #category : #tests }
TLSortingStrategiesTests >> testComparableUsingStrategySortExistingContent [
	self assert: (group collect: #entity) asArray equals: order.
	group sortingStrategy: TLComparableUsingStrategy new.
	self assert: (group collect: #entity) asArray equals: #(1 2 3 4 5 6 7 8 9 10)
]

{ #category : #tests }
TLSortingStrategiesTests >> testKeepingOrderStrategyAddNewElementAtTheEnd [
	group sortingStrategy: TLKeepingOrderStrategy new.
	group addDrawable: (TLSimpleNode new entity: 6).
	self assert: (group collect: #entity) asArray equals: order , {6}
]

{ #category : #tests }
TLSortingStrategiesTests >> testKeepingStrategyKeepOrder [
	strategy := TLKeepingOrderStrategy new.
	self assert: (group collect: #entity) asArray equals: order.
	strategy sortNodes: group.
	self assert: (group collect: #entity) asArray equals: order
]
