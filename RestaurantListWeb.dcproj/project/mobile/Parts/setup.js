/* 
 This file was generated by Dashcode and is covered by the 
 license.txt included in the project.  You may edit this file, 
 however it is recommended to first turn off the Dashcode 
 code generator otherwise the changes will be lost.
 */
var dashcodePartSpecs = {
    "back_button": { "initialHeight": 30, "initialWidth": 60, "leftImageWidth": 16, "rightImageWidth": 5, "text": "Back", "view": "DC.PushButton" },
    "browser": { "clearSelectionOnBack": true, "view": "DC.Browser" },
    "detailDescription": { "propertyValues": { "textBinding": { "keypath": "list.selection.description" } }, "text": "Description", "view": "DC.Text" },
    "detailSubtitle": { "propertyValues": { "textBinding": { "keypath": "list.selection.address" } }, "text": "Location", "view": "DC.Text" },
    "detailTitle": { "propertyValues": { "textBinding": { "keypath": "list.selection.name" } }, "text": "Title", "view": "DC.Text" },
    "header": { "rootTitle": "Restaurants", "view": "DC.Header" },
    "image": { "propertyValues": { "srcBinding": { "keypath": "*.imageUrl" } }, "view": "DC.ImageLayout" },
    "image1": { "propertyValues": { "srcBinding": { "keypath": "list.selection.imageUrl" } }, "view": "DC.ImageLayout" },
    "list": { "allowsEmptySelection": true, "labelElementId": "rowTitle", "listStyle": "DC.List.EDGE_TO_EDGE", "propertyValues": { "dataArrayBinding": { "keypath": "dataSource.content" } }, "sampleRows": 8, "selectionEnabled": true, "useDataSource": true, "view": "DC.List" },
    "stackLayout": { "subviewsTransitions": [{ "direction": "right-left", "duration": "", "timing": "ease-in-out", "type": "push" }, { "direction": "right-left", "duration": "", "timing": "ease-in-out", "type": "push" }], "view": "DC.StackLayout" },
    "text": { "propertyValues": { "textBinding": { "keypath": "*.name" } }, "text": "Text", "view": "DC.Text" },
    "text1": { "propertyValues": { "textBinding": { "keypath": "*.description" } }, "text": "Text", "view": "DC.Text" }
};



