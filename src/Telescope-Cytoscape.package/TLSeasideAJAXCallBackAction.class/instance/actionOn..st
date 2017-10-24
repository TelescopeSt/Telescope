action
actionOn: aTLDrawable
  self beforeBlock ifNotNil: [ self beforeBlock cull: aTLDrawable cull: aTLDrawable entity ].
  aTLDrawable generator executeAJAXCallBack: self url onDrawable: aTLDrawable  onElement: self cssQuery 