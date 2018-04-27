Class {
	#name : #TLAcknowledgeReceiptCommand,
	#superclass : #TLVisualizationServerCommand,
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'as yet unclassified' }
TLAcknowledgeReceiptCommand class >> command [
	^ #acknoledgeReceipt
]

{ #category : #'as yet unclassified' }
TLAcknowledgeReceiptCommand >> sendCommandOn: aWebSocket [
   aWebSocket
				sendMessage:
					(NeoJSONWriter toString: {{ #command -> 'acknoledgeReceipt' . #visuId -> self visuId } asDictionary})
]
