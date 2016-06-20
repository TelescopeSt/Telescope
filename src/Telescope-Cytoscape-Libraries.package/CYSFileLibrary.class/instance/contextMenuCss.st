libs
contextMenuCss
	^ '/*
 *contextMenu.js v 1.4.0
 *Author: Sudhanshu Yadav
 *s-yadav.github.com
 *Copyright (c) 2013 Sudhanshu Yadav.
 *Dual licensed under the MIT and GPL licenses
 */
/*Context menu css */
.iw-contextMenu {
  box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.12), 0px 1px 4px rgba(0, 0, 0, 0.12);
  border-radius: 2px;
  display: none;
  z-index: 1000;
  font-size: 15px;
  line-height: 32px;
  white-space: nowrap;
}
.iw-cm-menu {
  background: #FFF;
  color: rgba(0, 0, 0, 0.87);
  margin: 0px;
  padding: 8px 0px;
}
.iw-cm-menu li {
  list-style: none;
  border-bottom: 1px solid rgb(224, 224, 224);
  cursor: pointer;
  position: relative;
  margin-left: 0px;
  padding: 5px 24px;
  transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;
}
.iw-cm-menu li:last-of-type {
    border-bottom: none;
}
.iw-mOverlay {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0px;
  left: 0px;
  background: #FFF;
  opacity: .5;
}
.iw-contextMenu li.iw-mDisable {
  opacity: .3;
}
.iw-mSelected {
  background: rgba(0, 0, 0, 0.1) none repeat scroll 0% 0%;
}
.iw-cm-arrow-right {
  width: 0;
  height: 0;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-left: 5px solid #333333;
  position: absolute;
  right: 3px;
  top: 50%;
  margin-top: -3px;
}
.iw-mIcon {
  width: 20px;
  height: 20px;
  left: 0px;
  top: 3px;
  position: absolute;
}
/*context menu css end */
'