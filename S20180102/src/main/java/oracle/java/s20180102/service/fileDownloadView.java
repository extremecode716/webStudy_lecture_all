package oracle.java.s20180102.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class fileDownloadView extends AbstractView {

	// 생성자
	public fileDownloadView() {
		setContentType("application/download;charset=utf-8");
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		// Controller에서 넘겨준 데이터 가져오기
		File file = (File) model.get("downloadFile");
		
		// 데이터의 타입과 길이 설정하기
		response.setContentType(getContentType());
		response.setContentLength((int) file.length());
		
		// 다운로드 받는 파일의 이름 만들기
		// 다운로드를 할 때는 웹 주소를 이용하는 것이므로
		// 웹 주소 형식에 맞게 인코딩을 해 주어야 합니다.
		// 주소 부분을 인코딩할 때는 URLEncoder 클래스를
		// 사용합니다.
		String fileName = URLEncoder.encode(file.getName(), "utf-8");
		response.setHeader("Content-Disposition", "attachment;filename=\""
				+ fileName + "\";");
		// 파일 전송 방식 설정
		response.setHeader("Content-Transfer-Encoding", "binary");
		// 파일을 전송하기 위한 스트림 생성
		OutputStream out = response.getOutputStream();
		// 파일을 읽어내기 위한 스트림
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			// fis의 내용을 out에 복사
			FileCopyUtils.copy(fis, out);
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
				}
			}
		}
		// flush는 버퍼에 있는 내용을 전부 전송하는
		// 메소드 입니다.
		// 파일이나 네트워크에 데이터를 전송할 때는
		// 버퍼를 이용해서 저장한 후 일괄적으로 전송하므로
		// write, print 등으로 데이터를 기록한 후
		// flush()를 호출하지 않으면 전송이 되지 않을 수
		// 있습니다.
		out.flush();
	}
}
