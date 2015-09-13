/// <reference path="Greeter.ts" />

var greeter = new charette.Greeter('world')

var div = document.createElement('dit')
document.body.appendChild(div)

var button = document.createElement('button')
button.textContent = 'Say Hello'
button.onclick = function() {
    div.innerHTML = greeter.greet()
}

document.body.appendChild(button)
