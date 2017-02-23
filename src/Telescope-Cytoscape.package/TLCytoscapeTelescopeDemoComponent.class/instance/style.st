hooks
style
	^ 'body, html{
  height: 100%;
  width: 100%;	
  overflow: hidden;
  font-family: ''Helvetica'',''Arial'',sans-serif;
  margin: 0;
  padding: 0;
  scroll-behavior: smooth
}

main{
  display: flex;
  height: 100%;
  width: 100%;
  overflow: hidden;
}

.menu{
  width: 300px;
  height: 100%;
  overflow: auto;
  padding-left: 7px;
  list-style: none;
  margin: 0;
}

ol, ul{
  font-size: 14px;
  line-height: 24px;
  font-weight: 400;
  letter-spacing: 0;
}

#view{
  background: aliceblue;
  flex-grow:1;
  width:1px;
  height: 100%;
  overflow: auto;
  position: relative;
}

.top-menu{
  position:fixed;
  height:20px; 
  background-color: #B0BEC5;
  right: 0;
  left: 300px;
  margin-right: auto;
  margin-left: auto;
  width: 600px;
  display: flex;
  justify-content: space-around;
  z-index: 999;
  border-right: 1px solid grey;
  border-left: 1px solid grey;
  border-bottom: 1px solid grey;
  border-radius: 0 0 5px 5px;
}

.top-menu a{
  display: inline-block;
  text-decoration: none;
  color: white;
}

.telescopeVisu .fitButton {
    right: 30px;
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