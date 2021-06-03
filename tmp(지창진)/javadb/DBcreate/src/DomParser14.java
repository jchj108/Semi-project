
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
 * @author Ȳö��
 */
public class DomParser14 {
	
	private Document xmlDoc = null;
	
	public DomParser14( InputStream requestXml ){
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setIgnoringElementContentWhitespace(true);
		DocumentBuilder builder = null;
		
		try{ 
			builder = factory.newDocumentBuilder(); //factory�� ����ؼ� DOM Parser�� ��´�.
			xmlDoc = builder.parse(requestXml); //InputStream�� parsing�ϱ� ���� DOM����Ѵ�.
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
					 * JDK1.6�� ���� 2���� �Ʒ� ���ٷ� ������.
					 * contents[i] = nodes.item(i).getTextContent();
					 */
					Node node = nodes.item(i).getLastChild();
					if( node.getNodeType() == 3 ){ // 3�̸� Text
						contents[i] = node.getNodeValue(); //Text����� ��� ���ڿ��� ��ȯ�Ѵ�.
					}
				}
				return contents;
			}
		}
		return null;
	}
}
