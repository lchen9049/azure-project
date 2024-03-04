package com.project.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration
public class MyApplication {

    @RequestMapping("/")
    String home() {
        System.out.println("Hello World 1!");
        return "Hello World 1!";
    }

    public static void main(String[] args) {
        SpringApplication.run(MyApplication.class, args);
    }

}