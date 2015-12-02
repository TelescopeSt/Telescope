style
createStyleDictionaryWith: aCollectionOfProperties styleSheet: aTLStyleSheet entity: anEntity
	^ aCollectionOfProperties inject: Dictionary new into: [ :style :aProperty | [style at: aProperty put: ([(aTLStyleSheet perform: aProperty) value: anEntity] on: MessageNotUnderstood do: [:msg | msg receiver])] on: KeyNotFound do: []. style ] 