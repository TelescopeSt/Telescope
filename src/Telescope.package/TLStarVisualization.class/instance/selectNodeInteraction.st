private
selectNodeInteraction
	^ (TLCustomAction block: [ :node | self moveInCenter: node. userBlock value: node ] ) withMenu: 'Select'