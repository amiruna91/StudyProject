package kr.co.jhta.dao;

import java.util.List;

public interface RoleDao {

	List<String> getRolesUserById(String userId);
	List<String> getRolesByUrl(String url);
}
