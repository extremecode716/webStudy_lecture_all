package com.ch.hello;

import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//@RestController = @Controller + @ResponseBody // 스프링 4점대 이상 버전에서만 가능. 값을 돌려주는 어노테이션
//@Controller // 컨트롤러 어노테이션일 경우 @ResponseBody를 추가해줘야함.
@RestController
public class SampleController {
	@RequestMapping("/sample")
	//@ResponseBody
	public SampleVo sample() {
		SampleVo sv = new SampleVo();
		sv.setMno(23);
		sv.setFirstName("홍");
		sv.setLastName("길동");
		return sv;
	}
	// JSON형태로 변환 해줘서 리턴해줌. pom.xml에서 jackson 라이브러리를 추가해줘서 가능함.

	@RequestMapping("/list")
	public List<SampleVo> list() {
		List<SampleVo> list = new ArrayList<SampleVo>();
		for (int i = 1; i <= 10; i++) {
			SampleVo sv = new SampleVo();
			sv.setMno(i);
			sv.setFirstName("홍");
			sv.setLastName("길동" + i);
			list.add(sv);
		}
		return list;
	}
}