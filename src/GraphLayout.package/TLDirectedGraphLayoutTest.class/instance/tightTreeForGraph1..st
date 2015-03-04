as yet unclassified
tightTreeForGraph1: theGraph1

	| tightTreeConnections |
	tightTreeConnections := {($a -> $b).
	($b -> $c).
	($c -> $d).
	($d -> $h).
	($e -> $g).
	($f -> $g).
	($g -> $h)}.
	^ tightTreeConnections
		collect: [ :aLink | 
			(theGraph1 nodeFromEntity: aLink key) outgoingConnections
				detect: [ :aConnection | aConnection toNode = (theGraph1 nodeFromEntity: aLink value) ] ]