
import java.io.IOException;
import java.io.InputStream;
import org.w3c.dom.Node;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

/**
 * @author 황철연
 */
public class DomParser14 {
	
	private Document xmlDoc = null;
	
	public DomParser14( InputStream requestXml ){
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setIgnoringElementContentWhitespace(true);
		DocumentBuilder builder = null;
		
		try{ 
			builder = factory.newDocumentBuilder(); //factory를 사용해서 DOM Parser를 얻는다.
			xmlDoc = builder.parse(requestXml); //InputStream을 parsing하기 위해 DOM사용한다.
		}catch(SAXException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
	}
	
	public String[] getByTagName(String tagName){
		if(!(xmlDoc == null)){
			NodeList nodes = xmlDoc.getElementsByTagName(tagName);
			
			if(nodes.getLength() > 0){
				String[] contents = new String[nodes.getLength()];
				for(int i = 0 ; i < nodes.getLength(); i++){
					/*
					 * JDK1.6은 다음 2줄이 아래 한줄로 끝난다.
					 * contents[i] = nodes.item(i).getTextContent();
					 */
					Node node = nodes.item(i).getLastChild();
					if( node.getNodeType() == 3 ){ // 3이면 Text
						contents[i] = node.getNodeValue(); //Text노드의 경우 문자열을 반환한다.
					}
				}
				return contents;
			}
		}
		return null;
	}
}
