package com.example.demo.utils;

import java.io.PrintWriter;

public class JSFunction {

	public static void alertLocation(String msg, String url, PrintWriter out) {
		try {
			String script = "<script>" +
					" alert('" + msg + "');" +
					" location.href='" + url + "';" +
					"</script>";
			out.println(script);
		} catch (Exception e) {
			e.printStackTrace(); // 디버깅용
		}
	}

	public static void alertBack(String msg, PrintWriter out) {
		try {
			String script = "<script>" +
					" alert('" + msg + "');" +
					" history.back();" +
					"</script>";
			out.println(script);
		} catch (Exception e) {
			e.printStackTrace(); // 디버깅용
		}
	}
}
