package junit5;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import music.admin.sales.AdminSalesService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"classpath:config/context-servlet.xml"})
@TestMethodOrder(MethodOrderer.OrderAnnotation.class) //순서 지정
@WebAppConfiguration
public class Test1 {
	
	@Autowired
	AdminSalesService service;
	//가상MVC객체
	MockMvc mockMvc;
	
	@Autowired
	WebApplicationContext ctx;//어노테이션 추가
	MockHttpSession session;
	
	@BeforeEach
	void init() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		
		//세션
		MockHttpServletRequest request = new MockHttpServletRequest();
		RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));
		
	}
	
	@Test
	@Order(1)
	void selectAllTest() {
		List list = service.ticketStatistics();
		//System.out.println(list.size());
		for (int i=0; i<list.size(); i++) {
			Object[] objArr = (Object[])list.get(i);
			for (int j=0; j<objArr.length; j++) {
				System.out.print(objArr[j]+" ");
			}
			System.out.println();
		}
	}
	

}
