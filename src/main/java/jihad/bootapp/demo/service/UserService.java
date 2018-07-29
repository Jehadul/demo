package jihad.bootapp.demo.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jihad.bootapp.demo.model.Users;
import jihad.bootapp.demo.repository.IUserRepository;

@Service
@Transactional
public class UserService{
	
	@Autowired
	private IUserRepository userRepository;

	public UserService(IUserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}

	public void saveUser(Users user) {
		userRepository.save(user);
	}
	
	public List<Users> showAllUsers(){
		List<Users> users = new ArrayList<Users>();
		for(Users user : userRepository.findAll()) {
			users.add(user);
		}
		
		return users;
	}
	
	public void deleteMyUser(int id) {
		userRepository.deleteById(id);
	}
	
	public Users editUser(int id) {
		return userRepository.findById(id).get();
	}
	
	/*public Users findByUsernameAndPassword(String username, String password) {
		return userRepository.findByUsernameAndPassword(username, password);
	}*/
}
