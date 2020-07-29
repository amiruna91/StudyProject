package kr.co.jhta.service;


import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;


public class SampleTest {

	@Test
	public void testPlus1() {
		Sample sample = new Sample();
		int value = sample.plus(10, 30);
		assertEquals(40, value);	// 단언문
	}
	
	@Ignore
	@Test
	public void testMinus() {
		Sample sample = new Sample();
		int value = sample.minus(10, 30);
		assertEquals(-20, value);
	}
}
