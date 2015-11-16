node - creation
localNodeCreationStrategy
	^ nodeCreationStrategy ifNil: [ nodeCreationStrategy := (self nodeCreationStrategy ifNil: [ Halt now ]) copyAsSimpleStrategy ]