var game = {
    words: new Array(),
    img: 2111,
    run: true,
    a_word: function (w) {
        this.words.push(w);
    },
    t_word: function () {
        return this.words.pop();
    }
};

game.a_word("horse");
game.a_word("lemon");

var wordlist = new Array();
var guess_word;

document.addEventListener('keydown', function (event) {
    //alert(event.key);
    if (event.key === "Enter" && game.run === true) {
        guess_word = document.getElementById('odp').value.toUpperCase();
        guess_word = guess_word.split(' ').join('');
        if (guess_word === game.words[game.words.length - 1].toUpperCase()) {
            alert("Good answer :)");
            wordlist.push(game.t_word());
            if (game.words.length === 0) {
                game.run = false;
                document.getElementById("pojemnik").innerHTML = '<br>Finish!<br>' +
                    '<span style="font-size:x-large;text-align:left">' +
                    'Found answers:<ul id = "list">' +
                    '</ul></span>';
                var mylist = document.getElementById("list");

                for (var i = 0; i < wordlist.length; i++) {
                    var newlistitem = document.createElement('li');
                    newlistitem.textContent = wordlist[i];
                    mylist.appendChild(newlistitem);
                }
            }
            else {
                game.img++;
                var pic = "images/" + game.img + ".jpg";
                document.getElementById("picture").innerHTML = '<img style="width: 50% " src="' + pic + '".jpg" alt =""/>';
                document.getElementById("error").innerHTML ='';
            }
        }
        else {
            document.getElementById("error").innerHTML ='Bad answer!!! Try again.';
        }
        if (game.run === true) document.getElementById('odp').value = "";
    }
});

function buttonBack(){
    if(confirm("You have unsaved game. Do you want to continue?")) window.location.href = 'journey';
}