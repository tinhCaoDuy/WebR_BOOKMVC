package poly.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dao.*;
import poly.entity.*;

@Controller
public class Demo {
	
	String url;
	Integer bookID;
	ClientEntity clientLogin = null;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private CommentDAO commentDAO;
	
	
	 //show cate
	@ModelAttribute("category")
	public List<CategoryEntity> getCategories(){
		return categoryDAO.getCategories();
	}
	//show ten sau login
	@ModelAttribute("clientLogin")
	public ClientEntity getClient(){
		return clientLogin;
	}
	//show sach
	@RequestMapping(value="/abc",method = RequestMethod.GET)
	public String show(Model model) {
		
		url = "index";
		List<BookEntity> book =bookDAO.getBooks();
		System.out.println(book);
		model.addAttribute("books",book);
		model.addAttribute("isCate",0);
		return "client/index";
	}
	//show sach theo the loai
	@RequestMapping(value="/cate/{categoryid}",method=RequestMethod.GET)
	public String getBooksByCate(ModelMap model,@PathVariable("categoryid") Integer categoryid) {
		model.addAttribute("listBookByCate", categoryDAO.getBooksByCate(categoryid));
		model.addAttribute("isCate",1);
		return "client/index";
	}
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register(ModelMap model ) {
		model.addAttribute("user", new ClientEntity());
		return "client/register";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(ModelMap model,@ModelAttribute("user") ClientEntity us) {
		if ((us.getEmail().trim().length() == 0)||(us.getUsername().trim().length() == 0)||(us.getPassword().trim().length() == 0)) {
			model.addAttribute("message", "Vui lòng nhập đầy đủ thông tin sau đây !");
		}else {			
			try {
				List <ClientEntity> list=userDAO.getUsers();
				int check =0;
				for(ClientEntity s:list) {
					if(s.getEmail().equals(us.getEmail())) {
						check=1;
					}
				}
				if(check==1) {
					model.addAttribute("message", "Email đã tồn tại  !");				
				}else if(check==0) {
					us.setRole(0);
					userDAO.saveUser(us);
					model.addAttribute("message","Đăng kí thành công");						
				}
				 
			} catch (Exception e) {
				model.addAttribute("message", "Đăng kí thất bại!\n" );
				e.printStackTrace();
			}			
		}
	
		return "client/register";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "client/login";
	}
	@RequestMapping(value="/signout",method = RequestMethod.GET)
	public String signout(ModelMap model) {
		clientLogin = null;
		return "redirect:/abc";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String handleLogin(ModelMap model,@RequestParam("username") String username,
								@RequestParam("password") String password) {
		if (username.trim().length() == 0||password.trim().length() == 0) {
			model.addAttribute("message", "Vui lòng nhập username và password!");
		}
		else {
			ClientEntity client = userDAO.findUser(username, password);
			List<BookEntity> book =bookDAO.getBooks();
			System.out.println(book);
			model.addAttribute("books",book);	
			try {
				
				if(client==null){
					model.addAttribute("message", "Username hoặc password không chính xác, vui lòng kiểm tra lại!");			
				}
				
				if(client!=null && client.getRole()==0){
					System.out.println("Thành công");
					clientLogin = client;
					model.addAttribute("clientLogin",clientLogin);
					if(url.equals("index")) {
						return "redirect:/abc";
					}
					if(url.equals("detail")) {
						return "redirect:/detail/"+bookID;
					}				
				}
				if(client!=null && client.getRole()!=0){
					System.out.println("Thành công");
					clientLogin = client;
					model.addAttribute("clientLogin",clientLogin);
					if(url.equals("index")) {
						return "admin/admin";
					}
					if(url.equals("detail")) {
						return "redirect:/detail/"+bookID;
					}								
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		return "client/login";
	}

	//xuat ra 1 book trong detail
	@RequestMapping(value="/detail/{bookid}",method = RequestMethod.GET)
	public String showBookId(ModelMap model, @PathVariable Integer bookid)
	{ 
		url = "detail";
		bookID = bookid;
		BookEntity book = bookDAO.getBooking(bookid);
		model.addAttribute("listComment", commentDAO.getComments(bookid));
		model.addAttribute("detail",book); 
		model.addAttribute("comment",new CommentEntity()); 
		
		return "client/detail";
	}
	//tao cmt
	@RequestMapping(value="/comment",method = RequestMethod.POST)
	public String comment(ModelMap model, @ModelAttribute("comment") CommentEntity comment)
	{ 		
		commentDAO.addComment(comment);
		return "redirect:/detail/"+bookID;
	}
	



}
