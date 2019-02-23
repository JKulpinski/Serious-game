package com.manning.readinglist;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class test1 {

    public static WebDriver wd = new ChromeDriver();
    public String url;

    @Given("^Open login page$")
    public void open_login_page() throws Exception {
        System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir") + "\\chromedriver.exe");

        url = "http://projects.nile.teicrete.gr:8080/langStorm";

        wd.get(url);

    }

    @Given("^Click register button$")
    public void click_Register_button() throws Exception {
        wd.findElement(By.xpath("//*[@id=\"main\"]/a")).click();
    }

    @When("On Register page enter {string} {string} {string} {string}")
    public void on_Register_page_enter(String string, String string2, String string3, String string4) {
        wd.findElement(By.name("login")).click();
        wd.findElement(By.name("login")).sendKeys(string);
        wd.findElement(By.name("email")).click();
        wd.findElement(By.name("email")).sendKeys(string2);
        wd.findElement(By.name("pass")).click();
        wd.findElement(By.name("pass")).sendKeys(string3);
        wd.findElement(By.name("pass2")).click();
        wd.findElement(By.name("pass2")).sendKeys(string4);
    }

    @When("Click submit button")
    public void click_submit_button() {
        wd.findElement(By.xpath("//*[@id=\"main\"]/form/div[5]/input")).click();
    }

    @When("On Register page enter login {string}")
    public void on_Register_page_enter_login(String string) {
        wd.findElement(By.name("login")).click();
        wd.findElement(By.name("login")).sendKeys(string);
    }

    @Then("There is validation error {string}")
    public void there_is_validation_error(String string) {
        Assert.assertTrue(wd.findElement(By.id("alerts")).getText().contains(string));
    }

    @Then("There is no validation error {string}")
    public void there_is_no_validation_error(String string) {
        Assert.assertFalse(wd.findElement(By.id("alerts")).getText().contains(string));
    }
}
