package pl.edu.utp.po.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Users {
    public Users(){
        this.points = 0;
        this.level = 1L;
        this.rebus = 0;
        this.runner = 0;
        this.hangman = 0;
        this.language = "en";
        this.coins = 10;
    }

    public Users(String login, String email, String pass) {
        this.login = login;
        this.email = email;
        this.pass = pass;
        this.points = 0;
        this.level = 1L;
        this.rebus = 0;
        this.runner = 0;
        this.hangman = 0;
        this.language = "en";
        this.coins = 10;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String login;
    private String email;
    private String pass;
    private Integer points;
    private Long level;
    private Integer rebus;  //0 - nie próbował przejść, 1 - nie udało się, 2 - przeszedł
    private Integer runner;
    private Integer hangman;
    private String language;
    private Integer coins;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public Long getLevel() {
        return level;
    }

    public void setLevel(Long level) {
        this.level = level;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Integer getCoins() {
        return coins;
    }

    public void setCoins(Integer coins) {
        this.coins = coins;
    }

    public Integer getRebus() {
        return rebus;
    }

    public void setRebus(Integer rebus) {
        this.rebus = rebus;
    }

    public Integer getRunner() {
        return runner;
    }

    public void setRunner(Integer runner) {
        this.runner = runner;
    }

    public Integer getHangman() {
        return hangman;
    }

    public void setHangman(Integer hangman) {
        this.hangman = hangman;
    }
}
