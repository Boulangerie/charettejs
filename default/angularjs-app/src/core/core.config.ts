/// <reference path="../../node_modules/charettejs/typings/tsd.d.ts"/>

namespace charettejs.angular.core {

    export var CoreConfig = ['localStorageServiceProvider', '$translateProvider', 'tmhDynamicLocaleProvider', 'i18nConfig', CoreConfigFunction];

    export function CoreConfigFunction(
        localStorageServiceProvider: angular.local.storage.ILocalStorageServiceProvider,
        $translateProvider: angular.translate.ITranslateProvider,
        tmhDynamicLocaleProvider: angular.dynamicLocale.tmhDynamicLocaleProvider,
        i18nConfig: any
    ) {

        localStorageServiceProvider.setPrefix('charettejs.angular');
        localStorageServiceProvider.setStorageType('sessionStorage');

        if (!_.isUndefined(i18nConfig)) {
            _.forEach(i18nConfig, (data: any, locale: string) => {
                $translateProvider.translations(locale, data);
            });
        }

        $translateProvider.useSanitizeValueStrategy('escape');
        $translateProvider.preferredLanguage('en');

        tmhDynamicLocaleProvider.localeLocationPattern('assets/locales/angular-locale_{{locale}}.js');
    }
}
