package SOF3021.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import SOF3021.entities.Accounts;


@Repository
public interface AccountRepository extends JpaRepository<Accounts, Integer> {
	public Accounts findByUsernameEquals (String username);
}
