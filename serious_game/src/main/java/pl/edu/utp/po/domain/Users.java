package pl.edu.utp.po.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Users {
    public Users(){
        this.points = 0;
        this.level = 0L;
        this.rebus = true;
        this.picture = true;
        this.hangman = true;
    }

    public Users(String login, String email, String pass) {
        this.login = login;
        this.email = email;
        this.pass = pass;
        this.points = 0;
        this.level = 0L;
        this.rebus = true;
        this.picture = true;
        this.hangman = true;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String login;
    private String email;
    private String pass;
    private Integer points;
    private Long level;
    private Boolean rebus;
    private Boolean picture;
    private Boolean hangman;

    public Boolean getRebus() {
        return rebus;
    }

    public void setRebus(Boolean rebus) {
        this.rebus = rebus;
    }

    public Boolean getPicture() {
        return picture;
    }

    public void setPicture(Boolean picture) {
        this.picture = picture;
    }

    public Boolean getHangman() {
        return hangman;
    }

    public void setHangman(Boolean hangman) {
        this.hangman = hangman;
    }

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

}
