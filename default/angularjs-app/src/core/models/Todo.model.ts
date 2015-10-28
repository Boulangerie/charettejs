/// <reference path="../../../../node_modules/charettejs/typings/tsd.d.ts"/>
/// <reference path="./base.model.ts"/>

namespace charettejs.angular.core {

  export interface ITodo extends IBase {
    title: string
    created: number
    completed: boolean

    getLifeTime(): number
  }

  export class Todo extends Base implements ITodo {
    public created: number
    public completed: boolean

    constructor(public title = '') {
      super('todo');

      this.created = (new Date()).getTime()
      this.completed = false
    }


    /**
     * Compute life ms.
     * @returns {number}
     */
    public getLifeTime(): number {
      return (new Date()).getTime() - this.created
    }


    public toStringData() {
      return {
        title: this.title,
        created: this.created
      }
    }
  }
}
