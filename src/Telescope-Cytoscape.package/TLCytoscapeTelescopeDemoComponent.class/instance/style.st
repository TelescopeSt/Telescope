hooks
style
	^ 'body, html{
  height: 100%;
  width: 100%;	
  font-family: ''Roboto'',''Helvetica'',''Arial'',sans-serif;
  margin: 0;
  margin-bottom: 0 !important;
  padding: 0;
  scroll-behavior: smooth
}

.wa-toolbar{
	display: none;
}

main{
  display: flex;
  flex-direction: column;
  height: 100%;
  width: 100%;
  overflow: hidden;
}

button{
background: 0 0;
border: none;
border-radius: 2px;
position: relative;
height: 36px;
margin: 0;
min-width: 64px;
padding: 0 16px;
display: inline-block;
font-family: "Roboto","Helvetica","Arial",sans-serif;
font-size: 14px;
font-weight: 500;
text-transform: uppercase;
letter-spacing: 0;
overflow: hidden;
will-change: box-shadow;
transition: box-shadow .2s cubic-bezier(.4,0,1,1),background-color .2s cubic-bezier(.4,0,.2,1),color .2s cubic-bezier(.4,0,.2,1);
outline: none;
cursor: pointer;
text-decoration: none;
text-align: center;
line-height: 36px;
vertical-align: middle;
color: #009688;
}

button:hover {
    background-color: rgba(158,158,158,.2);
}

#telescope-filters{
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
	height: 45px;
	min-height: 45px;
	width: 100%;
	display: flex;
	align-items: center;
	padding-left: 10px;
}

#telescope-content{
  min-height: 200px;
  flex: 1 1 auto;
  width: 100%;
  display: flex;
}

#telescope-selection{
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
	width: 300px;
	height: 100%;
	position: relative;
}

#telescope-selection__list{
	height: 100%;
	width: 100%;
}

#telescope-panel{
	height: 100%;
	flex: 1 1 auto;
	display: flex;
   flex-direction: column;
}

#telescope-panel__tabs{
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-align-content: space-between;
	-ms-flex-line-pack: justify;
	align-content: space-between;
	-webkit-align-items: flex-start;
	-ms-flex-align: start;
	align-items: flex-start;
	height: 48px;
	padding: 0;
	margin: 0;
	border-bottom: 1px solid #e0e0e0;
}

#telescope-panel__tabs a{
margin: 0;
border: none;
padding: 0 24px;
float: left;
position: relative;
display: block;
text-decoration: none;
height: 48px;
line-height: 48px;
text-align: center;
font-weight: 500;
font-size: 14px;
text-transform: uppercase;
color: rgba(0,0,0,.54);
overflow: hidden;
}

#telescope-panel__tabs a.isActive{
  color: rgba(0,0,0,.87);
}

#telescope-panel__tabs a.isActive::after {
    height: 2px;
    width: 100%;
    display: block;
    content: " ";
    bottom: 0;
    left: 0;
    position: absolute;
    background: #009688;
    -webkit-animation: border-expand .2s cubic-bezier(.4,0,.4,1).01s alternate forwards;
    animation: border-expand .2s cubic-bezier(.4,0,.4,1).01s alternate forwards;
    transition: all 1s cubic-bezier(.4,0,1,1);
}

#telescope-panel .panel{
	flex: 1 1 auto;
	display: none;
}

#telescope-panel .panel.isActive{
	display: block;
}

.chip{
    height: 32px;
    font-family: "Roboto","Helvetica","Arial",sans-serif;
    line-height: 32px;
    padding: 0 12px;
    border: 0;
    border-radius: 16px;
    background-color: #dedede;
    display: inline-block;
    color: rgba(0,0,0,.87);
    margin: 2px 10px;
    font-size: 0;
    white-space: nowrap;
    cursor: pointer;
}

.chip:hover {
    background-color: #d6d6d6;
}

.chip.isSelected{
    background-color: #80CBC4;
    color: #FFF;
}

.chip.isSelected:hover {
    background-color: #26A69A;
}

.chip span{
  font-size: 13px;
  vertical-align: middle;
  display: inline-block;
}

.resizer{
  width:3px;
  height:100%;
  top:auto;
  right:-1px;
  bottom:0;
  left:auto;
  position:absolute;
  z-index:3;
  cursor:ew-resize
}

ul{
  height: 100%;
  width: 100%;
  margin: 0;
  padding: 0;
  font-size: 16px;
  font-weight: 400;
  letter-spacing: 0;
  overflow: hidden;
}

ul:hover{
  overflow-y: auto;
}

li{
  width: calc(100% -15px);
  padding-left: 15px;
  white-space: nowrap;
  cursor: pointer;
  color: rgba(0, 0, 0, 0.87);
  line-height: 48px;
  text-overflow: ellipsis;
  overflow: hidden;
}

li:hover {
    background-color: #EEEEEE;
}

li:nth-child(2n){
  background-color: #F5F5F5;
}

li:nth-child(2n):hover{
  background-color: #E0E0E0;
}

li.isSelected{
  background-color: #80CBC4;
  color: #FFF;
}

li.isSelected:hover{
  background-color: #26A69A;
  color: #FFF;
}

.telescopeVisu .fitButton {
    right: 30px;
}

#tldemo .telescopeVisu{
height: calc(100% - 20px);
}

.hljs {
  display: block;
  overflow-x: auto;
  padding: 0.5em;
  color: #333;
}

.hljs-comment,
.hljs-quote {
  color: #998;
  font-style: italic;
}

.hljs-keyword,
.hljs-selector-tag,
.hljs-subst {
  color: #00a;
}

.hljs-number,
.hljs-literal,
.hljs-variable,
.hljs-template-variable,
.hljs-tag .hljs-attr {
  color: #800000;
}

.hljs-string,
.hljs-doctag {
  color: #800080;
}

.hljs-title,
.hljs-section,
.hljs-selector-id {
  color: #900;
  font-weight: bold;
}

.hljs-subst {
  font-weight: normal;
}

.hljs-type,
.hljs-class .hljs-title {
  color: #458;
  font-weight: bold;
}

.hljs-tag,
.hljs-name,
.hljs-attribute {
  color: #000080;
  font-weight: normal;
}

.hljs-regexp,
.hljs-link {
  color: #009926;
}

.hljs-symbol,
.hljs-bullet {
  color: #990073;
}

.hljs-built_in,
.hljs-builtin-name {
  color: #0086b3;
}

.hljs-meta {
  color: #999;
  font-weight: bold;
}

.hljs-deletion {
  background: #fdd;
}

.hljs-addition {
  background: #dfd;
}

.hljs-emphasis {
  font-style: italic;
}

.hljs-strong {
  font-weight: bold;
}

pre {
  background-color: #eee;
  color: rgb(0,0,0);
}
	
pre:hover { 
  background-color: rgba(0,0,0,0.1);
}
'