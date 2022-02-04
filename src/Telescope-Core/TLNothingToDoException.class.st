"
Description
--------------------

I am an exception raised when the user request an action but nothing will happen. For example if an interaction should add a connections to other node, but in one case there is no other node, then no connection will be added and we raise this exception. 

I should be handle  by connector to  send a return to user.

"
Class {
	#name : #TLNothingToDoException,
	#superclass : #Warning,
	#category : #'Telescope-Core-Exceptions'
}
