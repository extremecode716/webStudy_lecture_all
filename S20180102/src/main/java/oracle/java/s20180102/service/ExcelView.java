package oracle.java.s20180102.service;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.servlet.view.AbstractView;

import oracle.java.s20180102.model.GServDto;

public class ExcelView extends AbstractView {

	private static final String CONTENT_TYPE_XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

	// 생성자
	public ExcelView() {
	}

	@Override
	protected boolean generatesDownloadContent() {
		return true;
	}

	@Override
	protected final void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Workbook workbook = createWorkbook();

		setContentType("CONTENT_TYPE_XLSX");
		System.out.println("test1");
		buildExcelDocument(model, workbook, request, response);

		response.setContentType(getContentType());

		ServletOutputStream out = response.getOutputStream();
		out.flush();
		workbook.write(out);
		out.flush();

		if (workbook instanceof SXSSFWorkbook) {
			((SXSSFWorkbook) workbook).dispose();
		}
	}
	
	
	protected Workbook createWorkbook(){
        return new XSSFWorkbook();
    }
	
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		 String type = model.get("excelType").toString();
		 System.out.println("test1"); 
         
         if(type.equals("board")){
         System.out.println("test1"); 
         List<GServDto> excelList = (List<GServDto>)model.get("excelList");
         Sheet sheet = workbook.createSheet(type);
         Row row = null;
         int rowCount = 0;
         int cellCount = 0;
          
         row = sheet.createRow(rowCount++);

         row.createCell(cellCount++).setCellValue("서비스명");
         row.createCell(cellCount++).setCellValue("매출일");
         row.createCell(cellCount++).setCellValue("예약인원");
         row.createCell(cellCount++).setCellValue("총 결제금액");
         row.createCell(cellCount++).setCellValue("적립금");

         for(GServDto vo : excelList){
             row = sheet.createRow(rowCount++);
             cellCount = 0;
             row.createCell(cellCount++).setCellValue(vo.getGservTitle());
             row.createCell(cellCount++).setCellValue(vo.getTourDate());
             row.createCell(cellCount++).setCellValue(vo.getReMemSize());
             row.createCell(cellCount++).setCellValue(vo.getReMemSize() * vo.getGservPrice());
             row.createCell(cellCount++).setCellValue(vo.getReMemSize() * vo.getGservPrice() * 70/100);
         }
      }
	}

}
