import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class xmlParsingTest {

	public static void main(String[] args) {

		BufferedReader br = null;
		try {

			String urlstr = "http://api.kcisa.kr/openapi/service/rest/meta13/getKOCD0101?serviceKey=75005ce4-4725-485f-800b-e0fde88fa2bb";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			String result = "";
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			System.out.println(result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}