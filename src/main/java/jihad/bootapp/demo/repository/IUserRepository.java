package jihad.bootapp.demo.repository;

import org.springframework.data.repository.CrudRepository;

import jihad.bootapp.demo.model.Users;

public interface IUserRepository extends CrudRepository<Users, Integer>{
	public Users findByUsernameAndPassword(String username, String password);
}
