

package online.newbrandshop.service;

import java.util.ArrayList;
import java.util.List;

import online.newbrandshop.modal.ProfileUserEntity;
import online.newbrandshop.modal.RoleUserEntity;
import online.newbrandshop.modal.UserEntity;
import online.newbrandshop.repository.UserRepository;
import online.newbrandshop.security.MyUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity=null;
		try {
			userEntity = userRepository.findOneByUserNameAndActive(username, 1);
		}
		catch (Exception e){
			System.out.println(e);
		}
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		RoleUserEntity role = userEntity.getRoleUserEntity();
		authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(), true, true, true, true,
				authorities);
		if (role.getRoleName().equals("customer")||role.getRoleName().equals("admin")) {
			ProfileUserEntity profileUser = userEntity.getProfileUserEntity();
			if(profileUser==null)return myUser;
			myUser.setName(profileUser.getName());
			myUser.setAddress(profileUser.getAddress());
			myUser.setPhonenumber(profileUser.getPhonenumber());
			myUser.setEmail(userEntity.getEmail());
		}
		return myUser;
	}

}
