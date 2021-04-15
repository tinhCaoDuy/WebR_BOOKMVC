package poly.controller;

import java.io.File;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.SessionFactory;
import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.dao.*;
import poly.entity.*;

@Controller
public class AdminController {
	@Autowired
	ServletContext context;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private BookDAO bookDAO;

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private CommentDAO commentDAO;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String showAdmin(Model model) {

		List<BookEntity> book = bookDAO.getBooks();
		System.out.println(book);
		model.addAttribute("book", book);
		return "admin/book";
	}

	@ModelAttribute("category")
	public List<CategoryEntity> getCategories() {
		return categoryDAO.getCategories();
	}

	@RequestMapping(value = "/admin/insert", method = RequestMethod.GET)
	public String insertBook(ModelMap model) {
		model.addAttribute("book", new BookEntity());
		return "admin/insert";
	}

	// them
	@RequestMapping(value = "/admin/insert", method = RequestMethod.POST)
	public String insertBook(ModelMap model, @ModelAttribute("book") BookEntity book, HttpServletRequest request,
			@RequestParam("photo") MultipartFile photo) {
			context = request.getSession().getServletContext();
			if (book.getTitle().trim().length() == 0||photo.isEmpty()||book.getAuthor().trim().length() == 0||book.getDescription().trim().length() == 0) {
				model.addAttribute("message", "Vui lòng nhập đầy đủ thông tin sách !");
			}
			else {
				try {
					List <BookEntity> list=bookDAO.getBooks();
					int check =0;
					for(BookEntity b:list) {
						if(b.getTitle().equals(book.getTitle())) {
							check=1;
						}
					}
					if(check==1) {
						model.addAttribute("message", "Sách đã tồn tại  !");				
					}else if(check==0) {					
						String photoPath = context.getRealPath("/resources/admin/img/product/" + photo.getOriginalFilename());//chuyen doi dd
						photo.transferTo(new File(photoPath));
						book.setImage(photo.getOriginalFilename());
						bookDAO.addBook(book);
						TimeUnit.SECONDS.sleep(3);
						model.addAttribute("message", "Thêm thành công");					
					}
				
				} catch (Exception e) {
					// TODO: handle exception
					model.addAttribute("message", "Thêm thất bại !\n" + e.toString());
					e.printStackTrace();
				}
			}
		return "admin/insert";
	}

	// sửa
	@RequestMapping(value = "/admin/edit/{bookid}", method = RequestMethod.GET)
	public String editBook(ModelMap model, @PathVariable("bookid") Integer bookid) {
		BookEntity book = bookDAO.getBooking(bookid);
		model.addAttribute("book", book);
		return "admin/edit";
	}

	@RequestMapping(value = "/admin/edit/{bookid}", method = RequestMethod.POST)
	public String editBook(ModelMap model, @ModelAttribute("book") BookEntity book, HttpServletRequest request,
			@RequestParam("photo") MultipartFile photo) {
		context = request.getSession().getServletContext();
		Integer bookID= book.getBookid();
		if (book.getTitle().trim().length() == 0||photo.isEmpty()||book.getAuthor().trim().length() == 0||book.getDescription().trim().length() == 0) {
			model.addAttribute("message", "Vui lòng nhập thông tin sách cần sửa !");
		}else {
			try {
				String photoPath = context.getRealPath("/resources/admin/img/product/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				book.setImage(photo.getOriginalFilename());
				bookDAO.updateBook(book);
				TimeUnit.SECONDS.sleep(3);
				model.addAttribute("message", "Sửa thành công");			
			
			} catch (Exception e) {
				// TODO: handle exception
				model.addAttribute("message", "Sửa thất bại !\n");
				e.printStackTrace();
			}
		}

		return "redirect:/admin/edit/"+bookID;
	}
	
	@RequestMapping(value = "/admin/delete/{bookid}", method = RequestMethod.GET)
	public String deleteBook(ModelMap model, @PathVariable("bookid") Integer bookid) {
		bookDAO.deleteBook(bookid);
		return "redirect:/admin";
	}
	//them the loai
	@RequestMapping(value = "admin/insertCate", method = RequestMethod.GET)
	public String insertCate(ModelMap model) {
		model.addAttribute("cate", new CategoryEntity());
		return "admin/insertCate";
	}

	@RequestMapping(value = "admin/insertCate", method = RequestMethod.POST)
	public String insertCate(ModelMap model, @ModelAttribute("cate") CategoryEntity cate) {

		try {	
			
			categoryDAO.addCategory(cate);
			model.addAttribute("message", "Thêm mới thành công !");
		} catch (Exception e) {
			
			model.addAttribute("message", "Thêm mới thất bại !");
		} 

		return "admin/insertCate";
	}
	
	@RequestMapping(value = "/admin/user", method = RequestMethod.GET)
	public String showUser(Model model) {
		List<ClientEntity> user = userDAO.getUsers();
		System.out.println(user);
		model.addAttribute("user", user);
		return "admin/user";
	}
	
	@RequestMapping(value="/history/{id}",method = RequestMethod.GET)
	public String showBookUs(ModelMap model, @PathVariable Integer id)
	{ 
		model.addAttribute("listComment", commentDAO.getCommentsByUs(id));
		
		return "admin/history";
	}
}
