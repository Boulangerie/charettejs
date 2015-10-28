/// <reference path="../../../node_modules/charettejs/typings/tsd.d.ts"/>

namespace charettejs.angular.core {

    export interface IBase {
        _class: string
        name: string

        toString(): string
        toStringData(): Object
    }

    export class Base implements IBase {
        public _class: string;
        public name: string;

        constructor(_class: string) {
            this._class = _class;
        }

        public toString(): string {
            return this._class + '.' + this.name;
        }

        public toStringData(): Object {
            return {};
        }
    }
}
