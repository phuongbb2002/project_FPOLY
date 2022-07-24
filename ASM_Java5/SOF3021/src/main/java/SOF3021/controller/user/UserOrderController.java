package SOF3021.controller.user;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.fabric.xmlrpc.base.Data;

import SOF3021.beans.OrderModel;
import SOF3021.entities.Accounts;
import SOF3021.entities.OrderDetails;
import SOF3021.entities.Orders;
import SOF3021.entities.Products;
import SOF3021.repositories.OrderDetailRepository;
import SOF3021.repositories.OrderRepository;



@Controller
@RequestMapping("user")
public class UserOrderController {
	@Autowired
	private OrderDetailRepository ordetailRepo;

	@Autowired
	private OrderRepository  orderRepo;

	@GetMapping("getProduct/{id}")
	public String productDetail(@PathVariable("id") Products pro, Model model, @ModelAttribute("acc") Accounts acc) {
		model.addAttribute("pro", pro);
		return "user/product-detail";
	}

	@GetMapping("cart")
	public String cart(HttpServletRequest request, Model model, @ModelAttribute("acc") Accounts acc, @ModelAttribute("o") Orders o,
			@RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "5") int size,
			@RequestParam(name = "field", defaultValue = "id") Optional<String> field) {
		HttpSession session = request.getSession();
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		Orders order = (Orders) session.getAttribute("order");
		Pageable pageable = PageRequest.of(page, size, sort);
		Page<OrderDetails> p = this.ordetailRepo.findByOrdersEqualsAndStatusEquals(order, 0, pageable);
		model.addAttribute("ordetail", p);
		System.out.println("Id:" + p.getContent().get(0).getId());
		List<OrderDetails> ordMoney = this.ordetailRepo.findByOrdersEqualsAndStatusEquals(order, 0);
		int allMoney = 0;
		for (OrderDetails od : ordMoney) {
			allMoney = allMoney + (int) od.getPrice();
		}
		model.addAttribute("allMoney", allMoney);
		model.addAttribute("all", ordMoney);
		return "user/cart";
	}

	@GetMapping("order/{id}")
	public String order(@PathVariable("id") Products pro, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Orders order = (Orders) session.getAttribute("order");
		Accounts acc = (Accounts) session.getAttribute("acc");
		OrderDetails ordetail = new OrderDetails();
		ordetail.setOrders(order);
		ordetail.setQuantity(1);
		ordetail.setPrice(1 * pro.getPrice());
		ordetail.setProducts(pro);
		ordetail.setStatus(0);
		this.ordetailRepo.save(ordetail);
		session.setAttribute("monhang", this.ordetailRepo
				.findByOrdersEqualsAndStatusEquals(this.orderRepo.findByStatusEqualsAndAccountsEquals(0, acc), 0)
				.size());
		return "redirect:/user/cart";
	}

	@GetMapping("dec/{id}")
	public String dec(@PathVariable("id") OrderDetails ordetail, @RequestParam("sl") int sl) {
		System.out.println("Số lượng:" + sl);
		ordetail.setQuantity(sl - 1);
		ordetail.setPrice((sl - 1) * ordetail.getProducts().getPrice());
		this.ordetailRepo.save(ordetail);
		System.out.println("Số lượng:" + ordetail.getQuantity());
		return "redirect:/user/cart";
	}
	
	@GetMapping("inc/{id}")
	public String inc(@PathVariable("id") OrderDetails ordetail, @RequestParam("sl") int sl) {
		System.out.println("Số lượng:" + sl);
		ordetail.setQuantity(sl + 1);
		ordetail.setPrice((sl + 1) * ordetail.getProducts().getPrice());
		this.ordetailRepo.save(ordetail);
		System.out.println("Số lượng:" + ordetail.getQuantity());
		return "redirect:/user/cart";
	}
	
	@GetMapping("history")
	public String history(HttpServletRequest request, Model model, @ModelAttribute("acc") Accounts acc) {
		HttpSession session = request.getSession();
		session = request.getSession();
		Accounts acc1 = (Accounts) session.getAttribute("acc");
		List<Orders> order = this.orderRepo.findByAccountsEquals(acc1);
		model.addAttribute("od", order);
		return "user/history";
	}

	@PostMapping("pay")
	public String getpay(HttpServletRequest request, @ModelAttribute("o") Orders o, OrderModel orderModel) {
		HttpSession session = request.getSession();
		session = request.getSession();
		Orders order = (Orders) session.getAttribute("order");
		order.setAddress(orderModel.getAddress());
		order.setCreateDate(new Date( new java.util.Date().getTime()));
		order.setStatus(1);
		this.orderRepo.save(order);
		
		session = request.getSession();
		Accounts acc1 = (Accounts) session.getAttribute("acc");
		Orders order1 = new Orders();
		order1.setAccounts(acc1);
		order1.setStatus(0);
		this.orderRepo.save(order1);
		System.out.println("Chưa có hóa đơn!");
		session.setAttribute("order", order1);
		session.setAttribute("monhang", 0);
		return "redirect:/user/history";
	}
}
