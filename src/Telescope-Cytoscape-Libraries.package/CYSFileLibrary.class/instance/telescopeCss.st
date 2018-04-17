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
	display: flex;
   position: absolute;
   top: 5px;
   right: 5px;
	cursor: pointer;
	line-height: 34px;
}

.telescopeVisu .fitButton img{
	margin: 5px;
	height: 24px;
	width: 24px;
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

.qtip.qtip-default{
	-webkit-border-radius:2px;
	-moz-border-radius:2px;
	-ms-border-radius:2px;
	-o-border-radius:2px;
	border-radius:2px;
	background-clip:padding-box;
	z-index:999;
	background:rgba(97,97,97,0.9);
	color:#FFF;
	max-width:400px;
	text-align:center;
	line-height:14px;
	font-size:14px;
	padding:16px;
	border:0
}

.iw-contextMenu{
    z-index: 100000 !important;
}'