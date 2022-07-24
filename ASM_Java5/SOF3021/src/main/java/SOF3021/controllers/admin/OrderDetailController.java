package SOF3021.controllers.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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

import SOF3021.beans.OrderDetailModel;
import SOF3021.entities.OrderDetails;
import SOF3021.entities.Orders;
import SOF3021.entities.Products;
import SOF3021.repositories.OrderDetailRepository;
import SOF3021.repositories.OrderRepository;
import SOF3021.repositories.ProductRepository;


@Controller
@RequestMapping("admin/orderdetail")
public class OrderDetailController {
	@Autowired
	private OrderDetailRepository ordetailRepo;
	
	@Autowired
	private OrderRepository ordRepo;

	@Autowired
	private ProductRepository proRepo;

	@GetMapping("index")
	public String index(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "5") int size,
			@RequestParam(name = "field", defaultValue = "id") Optional<String> field,
			@ModelAttribute("ordetail") OrderDetails ordetail) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
//		if (page < 0) {
//			page = 0;
//		}
//		if (page > this.accRepo.findAll().size() / size - 1) {
////			int a =this.accRepo.findAll().size() / size;
////			if(a == 1) {
////				page = 0;
////			}else {
////				page = this.accRepo.findAll().size() / size;
////			}
//			page = this.accRepo.findAll().size() / size - 1;
//		}
		Pageable pageable = PageRequest.of(page, size, sort);
		Page<OrderDetails> p = this.ordetailRepo.findAll(pageable);
		model.addAttribute("ordetailview", p);
		model.addAttribute("page", page);
		model.addAttribute("field", field.orElse("id"));
		return "admin/orderdetail";
	}

//
//	@GetMapping("create")
//	public String create(@ModelAttribute("cate") Categories cate) {
//		return "category/create";
//	}
//
	@PostMapping("store")
	public String store(OrderDetailModel ordetailModel) {
		OrderDetails ordetail = new OrderDetails();
		ordetail.setOrders(ordetailModel.getOrders());
		ordetail.setProducts(ordetailModel.getProducts());
		ordetail.setPrice(ordetailModel.getPrice());
		ordetail.setQuantity(ordetailModel.getQuantity());
		this.ordetailRepo.save(ordetail);
		return "redirect:/admin/orderdetail/index";
	}

//
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") OrderDetails ordetail) {
		this.ordetailRepo.delete(ordetail);
		return "redirect:/admin/orderdetail/index";
	}

//
//	@GetMapping("edit/{id}")
//	public String edit(@PathVariable("id") Categories cate, Model model) {
//		model.addAttribute("cate", cate);
//		return "category/edit";
//	}
//
	@PostMapping("update/{id}")
	public String update(@PathVariable("id") OrderDetails ordetail, OrderDetailModel ordetailModel) {
		ordetail.setOrders(ordetailModel.getOrders());
		ordetail.setProducts(ordetailModel.getProducts());
		ordetail.setPrice(ordetailModel.getPrice());
		ordetail.setQuantity(ordetailModel.getQuantity());
		this.ordetailRepo.save(ordetail);
		return "redirect:/admin/orderdetail/index";
	}

	@ModelAttribute("ordlist")
	public Map<Integer, String> getOrd() {
		Map<Integer, String> map = new HashMap<>();
		List<Orders> c = this.ordRepo.findAll();
		for (int i = 0; i < c.size(); i++) {
			map.put(c.get(i).getId(), c.get(i).getAccounts().getFullname());
		}
		return map;
	}
	@ModelAttribute("prolist")
	public Map<Integer, String> getPro() {
		Map<Integer, String> map = new HashMap<>();
		List<Products> c = this.proRepo.findAll();
		for (int i = 0; i < c.size(); i++) {
			map.put(c.get(i).getId(), c.get(i).getName());
		}
		return map;
	}
}
