"use strict";
/*---------------------------------------------------------
 * Copyright (C) Rohit Gohri (https://rohit.page). All rights reserved.
 *--------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const FORMAT_DOCUMENT = "editor.action.formatDocument";
const FORMAT_MODIFIED = "editor.action.formatChanges";
/**
 * @deprecated
 */
const DOCUMENT_CODE_ACTION_KIND_LEGACY = vscode.CodeActionKind.SourceFixAll.append("format");
const DOCUMENT_CODE_ACTION_KIND = vscode.CodeActionKind.Source.append("formatDocument");
const MODIFIED_CODE_ACTION_KIND = vscode.CodeActionKind.Source.append("formatModified");
function activate(context) {
    context.subscriptions.push(vscode.languages.registerCodeActionsProvider("*", new FormatActions(), {
        providedCodeActionKinds: FormatActions.providedCodeActionKinds,
    }));
}
exports.activate = activate;
let cache;
/**
 * Provides code actions for calling format document and format modified
 */
class FormatActions {
    provideCodeActions(document, range) {
        if (cache)
            return cache;
        const formatDocumentActionLegacy = this.getFormatDocumentAction(DOCUMENT_CODE_ACTION_KIND_LEGACY);
        const formatDocumentAction = this.getFormatDocumentAction();
        const formatModifiedAction = this.getFormatModifiedAction();
        cache = [
            formatDocumentActionLegacy,
            formatDocumentAction,
            formatModifiedAction,
        ];
        return cache;
    }
    getFormatDocumentAction(actionKind = DOCUMENT_CODE_ACTION_KIND) {
        const action = new vscode.CodeAction("Format Document", actionKind);
        action.command = {
            command: FORMAT_DOCUMENT,
            title: "Format Document",
            tooltip: "This will format the document with the default formatter.",
        };
        return action;
    }
    getFormatModifiedAction() {
        const action = new vscode.CodeAction("Format Modified", MODIFIED_CODE_ACTION_KIND);
        action.command = {
            command: FORMAT_MODIFIED,
            title: "Format Modified",
            tooltip: "This will format the document's modified content (requires version control) with the default formatter.",
        };
        return action;
    }
}
exports.FormatActions = FormatActions;
FormatActions.providedCodeActionKinds = [
    DOCUMENT_CODE_ACTION_KIND_LEGACY,
    DOCUMENT_CODE_ACTION_KIND,
    MODIFIED_CODE_ACTION_KIND,
];
//# sourceMappingURL=extension.js.map