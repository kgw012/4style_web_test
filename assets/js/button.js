var buttons = {
    name: [
    'top_button',
    'pants_button',
    'shoes_button'
].map(document.getElementById, document),
    isClicked: [
        true,
        false,
        false
    ]
}

// console.log(buttons)

// function revealImage () {
//     console.log('hey')
// }

buttons.name.forEach(function (e, index) {
    e.addEventListener('click', function(){
        if(buttons.isClicked[index])
        {
            e.className = "button fit small";
            buttons.isClicked[index] = false;
        }
        else
        {
            e.className = "button primary fit small";
            buttons.isClicked[index] = true;
        }
    });
})