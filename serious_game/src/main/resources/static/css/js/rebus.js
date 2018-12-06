//filenames - nazwy obrazkow
//answers- odpowiedzi do obrazkow
console.log(document.getElementById("ert"));
var game = {
    words: 1,
    img: 1,
    run: true,
    points: 0,
    a_word: function (w) {
        this.words.push(w);
    },
    t_word: function () {
        return this.words.pop();
    },
    update_points: function () {
        document.getElementById("info").innerHTML = 'Current points: ' + this.points;
    }
};

var wordlist = [];
var guess_word;

document.addEventListener('keydown', function (event) {
    var cos = du;
    //alert(event.key);
    if (event.key === "Enter" && game.run === true) {
        guess_word = document.getElementById('odp').value.toUpperCase();
        guess_word = guess_word.split(' ').join('');
        if (guess_word === game.words[game.words.length - 1].toUpperCase()) {
            alert("Good answer :)");
            game.points += 1;
            game.update_points();

            //nie wiadomo czy ma byc lista wszystkich czy tylko zgadnietych
            wordlist.push(game.t_word());

        }
        else {
            alert("Bad answer!!!");
            game.t_word();
        }

        if (game.words.length === 0) {
            game.run = false;
            document.getElementById("container").innerHTML = '<br>Finish!<br>' +
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
            game.img.pop();
            var pic = "images/" + game.img;
            document.getElementById("picture").innerHTML = '<img style="width: 50% " src="' + pic + '"" alt =""/>';
            document.getElementById("error").innerHTML = '';
        }
        if (game.run === true) document.getElementById('odp').value = "";
    }
});

