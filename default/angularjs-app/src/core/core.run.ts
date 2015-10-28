/// <reference path="../../node_modules/charettejs/typings/tsd.d.ts"/>

namespace charettejs.angular.core {

    export var CoreRun = ['$translate', 'sessionService', 'tmhDynamicLocale', CoreRunFunction];

    export function CoreRunFunction(
        $translate: angular.translate.ITranslateService,
        tmhDynamicLocale: angular.dynamicLocale.tmhDynamicLocaleService
    ) {
        let language = 'fr'
        $translate.use(language);
        tmhDynamicLocale.set(language);
    }
}
