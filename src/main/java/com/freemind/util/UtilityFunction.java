package com.freemind.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilityFunction {
	public static Date getDateMMDDYYYY(String dateString) {
		Date date = null;
		try {
			if (dateString != null && !dateString.trim().isEmpty())
				date = new SimpleDateFormat("dd/MM/yyyy").parse(dateString);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return date;
	}
}
