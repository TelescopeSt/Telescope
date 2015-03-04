accessing
findNegativeCutValue: aCutValueDictionary
	^ (aCutValueDictionary associations detect: [ :association | association value < 0 ]) key