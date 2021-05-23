import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class xmlParsingTest {

	public static void main(String[] args) {

		BufferedReader br = null;
		try {

			String urlstr = "http://api.kcisa.kr/openapi/service/rest/convergence2019/getConver09?serviceKey=5c8c24cc-7c25-4fb6-8593-eb255d8a2b0c&numOfRows=100";
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