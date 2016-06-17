libs
telescopeCss
	^ '.telescopeVisu{
	position: relative;
	height: 100%;
	width: 100%;	
}

.telescopeVisu .tlLegend{
   position: absolute;
   top: 5px;
   left: 5px;
	background-color: white;
}

.telescopeVisu .fitButton{
   position: absolute;
   top: 5px;
   right: 5px;
	cursor: pointer;
	background-color: white;
}

.telescopeVisu  .tlWaiting{
	 position: absolute;
    top: 50%;
    text-align: center;
    left: 10%;
    width: 80%;	
	 color: rgb(96,125,139);
}

.tlLegendIcon {
    min-width: 30px;
}
'