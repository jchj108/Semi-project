//import java.io.IOException;
//
//import javax.lang.model.element.Element;
//import javax.xml.parsers.DocumentBuilder;
//import javax.xml.parsers.DocumentBuilderFactory;
//import javax.xml.parsers.ParserConfigurationException;
//
//import org.w3c.dom.Document;
//import org.w3c.dom.Node;
//import org.w3c.dom.NodeList;
//import org.xml.sax.SAXException;
//
//public class a {
//
//
//public void assignData(String uri){
//
//    try{
//            DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
//            DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
//            Document xml = documentBuilder.parse(uri);
//
//            Element root = xml.getDocumentElement();
//            NodeList nodeList = root.getElementsByTagName("item");
//
//            if(nodeList.getLength() ==0) return;
//            for(int i=0; i<nodeList.getLength(); i++){
//                Node nodeItem = nodeList.item(i);
//
//                try {
//                    String id = getTagValue("id",(Element)nodeItem);
//                    System.out.println(id);
//                    //여기서 값을 대입하시면 됩니다. 
//                    //저의 경우는 데이터용 클래스를 따로 반들어서 getter setter 로 사용하였습니다. 
//                } catch (Exception e) {
//                }
//            }
//        } catch (ParserConfigurationException e){
//        } catch (SAXException e){
//        } catch (IOException e){
//        } catch (Exception e){
//        }
//}
//
//private String getTagValue(String sTag, Element element) {
//    try{
//        String result = element.getElementsByTagName(sTag).item(0).getTextContent();
//        return result;
//    } catch(NullPointerException e){
//        return "";
//    } catch(Exception e){
//        return "";
//    }
//}
//	}
//
//}
