<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>
Image search in daum
</title>
</head>
<body>
<?php
// xml 읽기
$rTarget = !isset($_GET['rTarget'])? "image" : $_GET['rTarget'];
$rResult = !isset($_GET['rResult'])? 10 : $_GET['rResult'];
$rStart = !isset($_GET['rStart'])? 1 : $_GET['rStart'];
$rSort = !isset($_GET['rSort'])? 'sim' : $_GET['rSort'];
$rOutput = !isset($_GET['rOutput'])? 'xml' : $_GET['rOutput'];

if($rQuery!=$_GET['rQuery'])
	$rStart = 1;
$rQuery=!isset($_GET['rQuery'])? "" : $_GET['rQuery'];
$rKey= "d89fa41f1e967af499fd04b51438404ecf6b6d8c";
$rQuery=urlencode($rQuery);
?>
<form id="form" method="get" action="." enctype="multipart/form-data">
<div style="text-align:center">
<br />
<input type="hidden" name="rTarget" value="<?=$rTarget?>"/><br />
<input type="hidden" name="rPageno" value="1"/><br />
<input type="hidden" name="rResult" value="<?=$rResult?>"/><br />
<input type="hidden" name="rSort" value="<?=$rSort?>"/><br />
<input type="text" name="rQuery" value="<?=urldecode($rQuery)?>"/><br />
<input type="submit" value="Shot" />
</div>
</form>
<div style="width:1000px;margin:auto;">

<a href="?<?echo "rQuery=".$rQuery."&amp;rTarget=".$rTarget."&amp;rPageno=".($rPageno-1)."&amp;rResult=".$rResult;?>">pre</a>
<a href="?<?echo "rQuery=".$rQuery."&amp;rTarget=".$rTarget."&amp;rPageno=".($rPageno+1)."&amp;rResult=".$rResult;?>">next</a>
<?

if($rQuery!=''){

	
// xml 파싱
/*------------------------------------------------------------------*
* 개 발 자 : 윤석규													
*-------------------------------------------------------------------*
* 이 메 일 : nanummp3@naver.com									   
*-------------------------------------------------------------------*
* 홈페이지 : http://www.ysksoft.com								   
*-------------------------------------------------------------------*/

class yskXmlClass {
	## private
	var $_xml_parser;
	var $_xml_encoding;
	var $_xml_chk		= 'n';
	var $_xml_item		= array();
	var $_xml_result	= array();

	/*
	## [실행 1] xml 열기
	-------------------------------------------------------------------------------------------
	include './class/yskXmlClass.php';

	$xml = new yskXmlClass;
	$prt = $xml->xmlOpen('http://blog.rss.naver.com/thinkfactory.xml','item');

	$count = count($prt['item']);
	for($x=0; $x<$count; $x++) {
		echo $prt['title'][$x]['value'].'<br />';
		echo $prt['link'][$x]['value'].'<br />';
		echo $prt['description'][$x]['value'].'<br /><br /><hr>';
	}
	-------------------------------------------------------------------------------------------
	*/
	function xmlOpen($pquery, $tag) {
		////////////////////////////////
$fp = fsockopen ("apis.daum.net", 80, $errno, $errstr, 30);
if (!$fp) {
	echo "$errstr ($errno)";
} else {
	fputs($fp, "GET /search/image?");
	fputs($fp, $pquery);
	fputs($fp, " HTTP/1.1\r\n");
	fputs($fp, "Host: apis.daum.net\r\n");
	fputs($fp, "Connection: Close\r\n\r\n");
	
	$header = "";
	while (!feof($fp)) {
		$out = fgets ($fp,512);
		if (trim($out) == "") {
			break;
		}
		$header .= $out;
	}
		
	$body = "";
	while (!feof($fp)) {
		$out = fgets ($fp,512);
		$body .= $out;
	}
		
	$idx = strpos(strtolower($header), "transfer-encoding: chunked");
	
	if ($idx > -1) { // chunk data
		$temp = "";
		$offset = 0;
		do {
			$idx1 = strpos($body, "\r\n", $offset);
			$chunkLength = hexdec(substr($body, $offset, $idx1 - $offset));
			
			if ($chunkLength == 0) {
				break;
			} else {
				$temp .= substr($body, $idx1+2, $chunkLength);
				$offset = $idx1 + $chunkLength + 4;
			}
		} while(true);
		$body = $temp;
		
	}
	//header("Content-Type: text/html; charset=utf-8");
	//	echo "test";
	//  echo $body;
	fclose ($fp);
}
////////////////////////////////
		$this->_tag = $tag;
		$xml_data = $body;
		  $this->_xmlDefine($xml_data);
			return $this->_xmlInte();
	   }

	## xml 선언
	function _xmlDefine($xml_data) {
		preg_match('/encoding="[^"]+"/', $xml_data, $pattern);
		$this->_xml_encoding = strtolower(preg_replace('/(encoding=)|(")/', '', $pattern[0]));

		$this->_xml_parser = xml_parser_create();
		xml_parser_set_option($this->_xml_parser, XML_OPTION_CASE_FOLDING, 0); //태그 이름을 소문자로 뿌려줌
		xml_parse_into_struct($this->_xml_parser, $xml_data, $this->_xml_item, $index);
		xml_parser_free($this->_xml_parser);
	}

	## xml 추출
	function _xmlInte() {
		foreach($this->_xml_item as $v) {
			if($v['tag'] == $this->_tag && $v['type'] == 'open') {
				$this->_xml_result[$v['tag']][] = '';
				$this->_xml_chk = 'y';
			}
			if($v['type'] == 'complete' && $this->_xml_chk == 'y') {
				//if($this->_xml_encoding == 'utf-8') {
				//	$this->_xml_result[$v['tag']][] = array('value'=>iconv('utf-8', 'euc-kr', $v['value']),'att'=>iconv('utf-8', 'euc-kr', $v['attributes']));
				//} else {
					$this->_xml_result[$v['tag']][] = array('value'=>$v['value'],'att'=>$v['attributes']);
				//}
			}
		}
		return $this->_xml_result;
	}

	## 에러표시
	function _error($msg='') {
		echo $msg;
		exit;
	}
}
// 츌력
	$xml = new yskXmlClass;
	$xml2 = new yskXmlClass;

	$pquery = "apikey=".$rKey."&q=".$rQuery."&result=".$rResult."&pageno=".$rPageno;
	$channel = $xml->xmlOpen($pquery,'channel');
	echo $channel['lastBuildDate'][0]['value'].'<br />총 ';
	echo $channel['totalCount'][0]['value'].'개의 검색 결과<br />';
	
	if($channel['totalCount'][0]['value']>0){
		echo $channel['pageno'][0]['value'].'번째 페이지<br />';
		echo $channel['result'][0]['value'].'<br />';


		$item = $xml2->xmlOpen($pquery,'item');

		$count = count($item['item']);
		for($x=0; $x<$count; $x++) {
			echo "<div style=\"float:left;width:200px;height:200px;\"><a href=\"".str_replace('&','&amp;',$item['url'][$x]['value'])."\"><img src=\"".$item['thumbnail'][$x]['value']."\" alt=\"".$item['title'][$x]['value']."\" title=\"".$item['title'][$x]['value']."\" /></a><br />";
			echo "<span style=\"font-size:10pt;\"><a href=\"".str_replace('&','&amp;',$item['link'][$x]['value'])."\">".$item['width'][$x]['value']."×".$item['height'][$x]['value']."<br />".strcut_utf8($item['title'][$x]['value'],20)."</a></span><br />";
			echo '</div>';
		}
	}
	/*
	$xml3 = new yskXmlClass;
	$pquery = "&key=".$rKey."&query=".$rQuery."&target=recmd";
	$result = $xml3->xmlOpen($pquery,'result');
	$count = count($result['item']);
	for($x=0; $x<$count; $x++) {
		echo $result['item'][$x]['value'].' / ';
	}*/

}

function strcut_utf8($str, $size)
 {
  $substr = substr($str, 0, $size*2);
  $multi_size = preg_match_all('/[\x80-\xff]/', $substr, $multi_chars);

  if($multi_size >0)
   $size = $size + intval($multi_size/3)-1;

  if(strlen($str)>$size)
  {
   $str = substr($str, 0, $size);
   $str = preg_replace('/(([\x80-\xff]{3})*?)([\x80-\xff]{0,2})$/', '$1', $str);
   $str .= '...';
  }

  return $str;
 }


?> 
<a href="?<?echo "rQuery=".$rQuery."&amp;rTarget=".$rTarget."&amp;rPageno=".($rPageno-1)."&amp;rResult=".$rResult;?>">pre</a>
<a href="?<?echo "rQuery=".$rQuery."&amp;rTarget=".$rTarget."&amp;rPageno=".($rPageno+1)."&amp;rResult=".$rResult;?>">next</a>
</div>

<div style="text-align:center;clear:both;">
<br /><br />
<a href="http://blog.kimchulho.com">http://blog.kimchulho.com</a>
</div>
<div style="text-align:center;clear:both;">
	<p><br />
		<a href="http://validator.w3.org/check?uri=referer"><img src="http://www.w3.org/Icons/valid-xhtml11" alt="Valid XHTML 1.1" style="height:31;width:88;border:0;" /></a>
	</p>
</div>
<div style="text-align:center;clear:both;">
<a href="http://s02.flagcounter.com/more/exm"><img src="http://s02.flagcounter.com/count/exm/bg=FFFFFF/txt=000000/border=CCCCCC/columns=2/maxflags=12/viewers=0/labels=0/" alt="free counters" /></a>
</div>

</body>
</html>