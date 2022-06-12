package com.example.nativeapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
public class Controller {

    @GetMapping("/controller")
    public String controller() {
        return LocalDateTime.now().toString();
    }
}
