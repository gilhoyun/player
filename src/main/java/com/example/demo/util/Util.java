package com.example.demo.util;

public class Util {
	public static boolean isEmpty(String str) {

		if (str == null) {
			return true;
		}

		if (str.trim().length() == 0) {
			return true;
		}
		return false;
	}

	public static String jsReplace(String msg, String uri) { // msg - 메시지, uri - 경로
		
		//공백처리(null)
		if (msg == null) {
			msg = "";
		}

		if (uri == null) {
			uri = "";
		}

		return String.format("""
				<script>
				   const msg = '%s'.trim();

				   if(msg.length > 0){
				       alert(msg);
				   }

				   location.replace('%s');
				</script>
				""", msg, uri); // 문자이어 붙이기로 받아온 파리미터 넣는 상황(공백검사, ''주의)
	}
}
