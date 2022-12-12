"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deactivate = exports.activate = void 0;
const Extension_1 = require("./Extension");
/**
 * The extension.
 */
let extension = new Extension_1.Extension();
/**
 * Activates the extension.
 *
 * @param context
 * The extension-context.
 */
let activate = (context) => extension.Activate(context);
exports.activate = activate;
/**
 * Deactivates the extension.
 */
let deactivate = () => extension.Dispose();
exports.deactivate = deactivate;
//# sourceMappingURL=index.js.map