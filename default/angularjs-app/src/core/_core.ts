/// <reference path="./core.config.ts"/>
/// <reference path="./core.run.ts"/>
/// <reference path="./services/CoreStorage.ts"/>

angular
    .module('charettejs.angular.core', [
        'charettejs.angular.config',
        'pascalprecht.translate',
        'LocalStorageModule',
        'tmh.dynamicLocale'
    ])
    .config(charettejs.angular.core.CoreConfig)
    .run(charettejs.angular.core.CoreRun)
    .service('coreStorageService', charettejs.angular.core.CoreStorage)
