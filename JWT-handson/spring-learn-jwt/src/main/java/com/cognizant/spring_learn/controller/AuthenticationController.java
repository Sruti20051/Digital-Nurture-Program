package com.cognizant.spring_learn.controller;

import com.cognizant.spring_learn.model.AuthenticationResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthenticationController {

    private static final Logger LOGGER =
            LoggerFactory.getLogger(AuthenticationController.class);

    @GetMapping("/authenticate")
    public AuthenticationResponse authenticate() {

        LOGGER.info("Start authenticate()");

        AuthenticationResponse response =
                new AuthenticationResponse("Dummy Token");

        LOGGER.info("End authenticate()");

        return response;
    }
}