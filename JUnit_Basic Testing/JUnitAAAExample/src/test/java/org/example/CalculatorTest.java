package org.example;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class CalculatorTest {

    private Calculator calculator;

    @Before
    public void setUp() {

        System.out.println("Setup: Creating Calculator Object");

        calculator = new Calculator();

    }

    @Test
    public void testAddition() {
        
        int a = 10;
        int b = 20;

        int result = calculator.add(a, b);

        assertEquals(30, result);

    }

    @After
    public void tearDown() {

        System.out.println("Teardown: Cleaning Resources");

        calculator = null;

    }

}