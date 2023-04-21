package phdhtl.cntt.email;

import java.util.Random;

public class emailVerification {
	public static int verification() {
		Random verification = new Random();
		int key= verification.nextInt(9999);
		return key;
	}
}
