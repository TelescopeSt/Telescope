Extension { #name : #TLExternalTriggerInteraction }

{ #category : #'*Telescope-Cytoscape' }
TLExternalTriggerInteraction >> externalTriggerForVisuId: visuId [
  ^'telescope.useExternalTrigger({"type":"externalTrigger"}, "',visuId,'","',self triggerId,'");' 
]

{ #category : #'*Telescope-Cytoscape' }
TLExternalTriggerInteraction >> triggerOnLeavesForVisuId: visuId [
  ^'telescope.triggerOnleaves(event, "',visuId,'");' 
]
