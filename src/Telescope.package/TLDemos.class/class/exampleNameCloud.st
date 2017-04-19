demos
exampleNameCloud
	<script: 'self exampleNameCloud open'>
	<tlFilter: #layout>
		
	^ TLNameCloud new
		entities: TLDrawable withAllSubclasses;
		nameProperty: #name;
		yourself