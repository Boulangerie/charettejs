/// <reference path="../../src/Greeter.ts" />

namespace charette {

    describe('Greeter', () => {

        describe('Initialization', () => {
            var name = 'John'
            var greeter = new Greeter(name)

            it('set greeting as John', () => {
                expect(greeter.greeting).toBe(name)
            })

            it('greet John :D', () => {
                expect(greeter.greet()).toBe('Hello, ' + name)
            })

        })

    })

}
