demos
exampleNameCloud
	<script: 'self exampleNameCloud open'>
		
	^ TLNameCloud new
		entities: TLDrawable withAllSubclasses;
		nameProperty: #name;
		yourself