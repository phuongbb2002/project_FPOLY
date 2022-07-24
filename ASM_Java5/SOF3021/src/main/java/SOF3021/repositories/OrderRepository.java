package SOF3021.repositories;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import SOF3021.entities.Accounts;
import SOF3021.entities.Orders;



@Repository
public interface OrderRepository extends JpaRepository<Orders, Integer> {
	public Orders findByStatusEqualsAndAccountsEquals(int id, Accounts acc);

	public List<Orders> findByAccountsEquals(Accounts acc);
}
