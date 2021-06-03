import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class URLCallExam {

	/**
	 * Author : 황 철 연
	 */
	public static void main(String[] args) {

		// 호출대상 URL(호출 결과를 XML로 반환)
		String targetUrl = "http://api.kcisa.kr/openapi/service/rest/meta13/getKOCD0101?serviceKey=75005ce4-4725-485f-800b-e0fde88fa2bb";

		try {
			/**
			 * (1) URL Call방식으로 JSP 호출시 다음과 같은 결과 페이지(XML형식)가 리턴된다고 가정하자.
			 * -------------------------------------------- <?xml version="1.0"
			 * encoding="EUC-KR"?> <root> <userId>testid03</userId> <swait>10</swait>
			 * <sexpect>0</sexpect> </root> --------------------------------------------
			 */

			// URL객체를 생성하고 해당 URL을 호출한다.
			URL url = new URL(targetUrl);
			URLConnection connection = url.openConnection();

			// 호출 결과(XML)를 읽기위해 InputStream 객체를 생성한다..
			InputStream is = connection.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);

			// 결과 내용을 한 줄씩 읽어서 retXml변수에 저장한다.
			String buf = null, retXml = "";
			while (true) {
				buf = br.readLine();
				if (buf == null)
					break;
				// *test*/System.out.println("buf >>" + buf);
				retXml += buf;
			}

			/* test */System.out.println("--- 응답 결과  XML 시작");
			/* test */System.out.println("retXml : " + retXml);
			/* test */System.out.println("--- 응답 결과  XML 끝");

			/**
			 * (2) 결과 XML을 DomParser로 파싱하여 결과 정보를 수출한다.
			 */
			byte[] reqBytes = retXml.getBytes("UTF-8");
			InputStream isRtn = new ByteArrayInputStream(reqBytes);

			DomParser14 domParser = new DomParser14(isRtn);

			// 결과 XML에서 추출한 최종 결과값
			String[] userid = domParser.getByTagName("title");
//			String[] swait = domParser.getByTagName("swait");
//			String[] sexpect = domParser.getByTagName("sexpect");
			/* test */System.out.println("userid : " + userid[0]);
//			/* test */System.out.println("swait : " + swait[0]);
//			/* test */System.out.println("sancexpect : " + sexpect[0]);
		} catch (IOException ioe) {
			String exCause = "";
			String exceptionName = ioe.getClass().getName();
			if (exceptionName.equals("java.net.MalformedURLException")) {
				// URL포멧이 잘못된 경우
				exCause = "MalformedURLException 발생(URL 포멧 오류) 오류 URL : [ " + targetUrl + "]";
			} else if (exceptionName.equals("java.net.UnknownHostException")) {
				// 호출하고자 하는 서버의 도메인 정보 또는 IP정보가 잘못됐을 경우
				exCause = "UnknownHostException 발생(호출 서버의 도메인 정보 또는 IP정보 오류) 오류 도메인:[" +

						targetUrl + "]";
			} else if (exceptionName.equals("java.io.FileNotFoundException")) {
				// 호출하는 페이지가 없는 경우
				exCause = "FileNotFoundException 발생(호출하는 페이지가 없음) 호출 페이지 : [ " + targetUrl + "]";
			} else if (exceptionName.equals("java.net.ConnectException")) {
				// 웹서버가 다운된 상태 : Connection refused: connect
				exCause = "ConnectException 발생(웹서버 다운 상태) 오류 메세지 : " + ioe.toString();
			} else if (exceptionName.equals("java.io.IOException")) {
				// 실제가 다운된 상태(Server returned HTTP response code: 503 for URL: http://***)
				exCause = "IOException 발생(WAS서버 다운 상태) 오류 메세지 : " + ioe.toString();
			}
			System.out.println(exCause);
		} finally {
			//
		}
	}
}