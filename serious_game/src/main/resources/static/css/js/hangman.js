var queue = new Array();
queue.push("I am still learning...");
queue.push("Do you have a minute?");
queue.push("Hi, nice to meet you!");
queue.push("Have a nice weekend.");
queue.push("No pain no gain.");
queue.push("How are you?");

var alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');

var text = {
    sentence: "",
    hiddenText: "",
    howManyMiss: 0
};
var yes = new Audio("audio/yes.wav");
var no = new Audio("audio/no.wav");

function showSentence(){
    text.sentence = queue.pop();
    let re = new RegExp("\\w","g");
    text.hiddenText = text.sentence.replace(re,"_");
    document.getElementById("board").innerHTML = text.hiddenText;
}

function showLetters() {
    let textDiv ="";
    for (let i = 0; i<alphabet.length; i++){
        let element = "lett" + i;
        textDiv += '<div class = "letter" onclick="checkAll('+i+')" id="'+element+'">' + alphabet[i] + '</div>';
    }
    document.getElementById("alphabet").innerHTML = textDiv;
}

String.prototype.replaceSign = function(place, sign){
    if (place > this.length - 1) return this.toString();
    else return this.substring(0,place) + sign + this.substring(place + 1);
};

function changeLetterAfterClick(bgColor, color, element){
    document.getElementById(element).style.background = bgColor;
    document.getElementById(element).style.border = "3px solid " + color;
    document.getElementById(element).style.color = color;
    document.getElementById(element).style.cursor = "default";
    document.getElementById(element).removeAttribute('onclick');
}

function checkAll(nr) {
    let select = false;
    for (let i = 0; i < alphabet.length; i++) {
        if (text.sentence.charAt(i).toLowerCase() === alphabet[nr].toLowerCase()) {
            text.hiddenText = text.hiddenText.replaceSign(i, alphabet[nr]);
            select = true;
        }
    }
    let element = "lett" + nr;

    if (select === true) {
        document.getElementById("board").innerHTML = text.hiddenText;
        yes.play();
        changeLetterAfterClick("#005700", "#00C000", element);
        if (text.sentence.toLowerCase() === text.hiddenText) {
            document.getElementById("alphabet").innerHTML = "This is the right answer!" ;
            resetGame();
            showCorrectAnswers();
        }
    }
    else {
        no.play();
        changeLetterAfterClick("#640d06", "#ee120d", element);

        text.howManyMiss++;
        if (text.howManyMiss <= 4) {
            let picture = "images/s" + text.howManyMiss + ".jpg";
            document.getElementById("gallows").innerHTML = '<img src="' + picture + '" alt=""/>';
        }
        if (text.howManyMiss==4) {
            document.getElementById("alphabet").innerHTML = "Game over! Sentence: " + text.sentence;
            resetGame();
        }
    }
}

function resetGame() {
    if (queue.length>0) {
        document.getElementById("newGame").style.visibility = "visible";
        document.getElementById("newGame").style.cursor = "pointer";
    }
    else {
        document.getElementById("newGame").removeEventListener("click", buttonNewGame);
        document.getElementById("board").innerHTML = "This is the end of the game ";
    }
}

function showCorrectAnswers(){
    document.getElementById("correct").style.visibility = "visible";
    let node = document.createElement("LI");
    let textSent = document.createTextNode(text.sentence);
    node.appendChild(textSent);
    document.getElementById("correct").appendChild(node);
}

function clickNewGameButton() {
    document.getElementById("newGame").addEventListener("click", buttonNewGame);
}

function buttonNewGame(){
    document.getElementById("newGame").style.visibility = "hidden";
    showLetters();
    showSentence();
    document.getElementById("gallows").innerHTML = '<img src="images/s0.jpg" alt=""/>';
    text.howManyMiss = 0;
}

function clickBackButton() {
    document.getElementById("back").addEventListener("click", buttonBack);
}

function buttonBack(){
    if(confirm("You have unsaved game. Do you want to continue?")) window.location.href = 'jurney';
}
window.addEventListener("load", function(){
    showLetters();
    showSentence();
    clickNewGameButton();
    clickBackButton();
});