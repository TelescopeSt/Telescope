as yet unclassified
actionOn: aTLDrawable
  self beforeBlock ifNotNil: [ self beforeBlock value: aTLDrawable  ].
  aTLDrawable generator executeAJAXCallBack: self url onDrawable: aTLDrawable  onElement: self cssQuery 