testing
externalTrigger: htmlElement atUrl: html
	htmlElement
		attributeAt: 'data-url' asSymbol put: html actionUrl asString;
		attributeAt: 'data-lclickCb' asSymbol
			put:
				(htmlElement storeCallback: (WAValueCallback on: [ :path | self actionBlock value: (self obtainElementForPath: path) ]));
		onClick: self jsCall