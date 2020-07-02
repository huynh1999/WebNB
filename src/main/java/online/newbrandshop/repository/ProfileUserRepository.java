/*
	@author:Quang Truong
	@date: Jan 14, 2020
*/

package online.newbrandshop.repository;

import online.newbrandshop.modal.ProfileUserEntity;
import online.newbrandshop.modal.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ProfileUserRepository extends JpaRepository<ProfileUserEntity, Long> {
	ProfileUserEntity findOneByPhonenumber(String phonenumber);

	ProfileUserEntity findOneByUserEntity(UserEntity userEntity);
	
}
