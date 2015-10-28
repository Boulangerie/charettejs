/// <reference path="../../../../node_modules/charettejs/typings/tsd.d.ts"/>
/// <reference path="../models/Todo.model.ts"/>

namespace charettejs.angular.core {

  export interface ICoreStorage {
    get (): charettejs.angular.core.Todo[]
    put(todos: charettejs.angular.core.Todo[])
  }

  export class CoreStorage implements ICoreStorage {

    STORAGE_KEYSPACE = 'charettejs-angular'

    get(): charettejs.angular.core.Todo[] {
      return JSON.parse(localStorage.getItem(this.STORAGE_KEYSPACE) || '[]')
    }

    put(todos: charettejs.angular.core.Todo[]) {
      localStorage.setItem(this.STORAGE_KEYSPACE, JSON.stringify(todos))
    }
  }
}
