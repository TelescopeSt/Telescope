demos
exampleNameCloud
	<script: 'self exampleNameCloud open'>
	<tlFilter: #visuTemplate>
	^ TLNameCloud new
		entities: TLDrawable withAllSubclasses;
		nameProperty: #name;
		yourself