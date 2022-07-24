package SOF3021.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import SOF3021.entities.OrderDetails;
import SOF3021.entities.Orders;



@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetails, Integer>{
	public List<OrderDetails> findByOrdersEqualsAndStatusEquals(Orders order, int status);
	public Page<OrderDetails> findByOrdersEqualsAndStatusEquals(Orders order, int status, Pageable page);
}
