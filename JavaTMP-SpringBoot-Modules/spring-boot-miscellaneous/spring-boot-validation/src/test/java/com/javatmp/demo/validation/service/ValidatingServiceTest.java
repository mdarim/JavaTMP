package com.javatmp.demo.validation.service;

import com.javatmp.demo.validation.entity.Input;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import jakarta.validation.ConstraintViolationException;

import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith(SpringExtension.class)
@SpringBootTest
class ValidatingServiceTest {

    @Autowired
    private ValidatingService service;

    @Test
    void whenInputIsValid_thenThrowsNoException() {
        Input input = new Input();
        input.setNumberBetweenOneAndTen(5);
        input.setIpAddress("111.111.111.111");

        service.validateInput(input);

        // then no exception
    }

    @Test
    void whenInputIsInvalid_thenThrowsException() {
        Input input = new Input();
        input.setNumberBetweenOneAndTen(0);
        input.setIpAddress("invalid");

        assertThrows(ConstraintViolationException.class, () -> {
            service.validateInput(input);
        });
    }

}
