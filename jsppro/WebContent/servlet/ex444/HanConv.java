package send;


public class HanConv {
  //UTF-8의 영문인코딩을 UTF-16의 한글로 바꾸는 메소드
  public static String toKor(String str){
    if(str==null || str.equals("") || str.equals("null")){
	  return str;
	}
	//8859_1을 euc-kr 변환
	try{
	  return new String(str.getBytes("8859_1"), "euc-kr");
	}catch(Exception e){
	  e.printStackTrace();
	  //변경 실패한 한글도 되돌려야 함
	  return str;//메소드의 리턴형을 맞추어 주어야 하기에
	}
  }
}
