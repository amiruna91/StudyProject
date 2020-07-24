package kr.co.jhta.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import kr.co.jhta.vo.User;

public class UserDaoSpringJdbcImpl implements UserDao {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public void insertUser(User user) {
		String sql = "insert into spring_users values(?,?,?,?,sysdate)";
		jdbcTemplate.update(sql, user.getId(), user.getName(), user.getPassword(), user.getEmail());
	}

	@Override
	public void deleteAllUser() {
		String sql = "delete from spring_users";
		jdbcTemplate.update(sql);
	}

	@Override
	public void deleteUserById(String userId) {
		String sql = "delete from spring_users where user_id = ?";
		jdbcTemplate.update(sql, userId);
	}

	@Override
	public void updateUser(User user) {
		String sql = "update spring_users set user_password = ?, user_email = ? where user_id = ? ";
		jdbcTemplate.update(sql, user.getPassword(), user.getEmail(), user.getId());
	}

	@Override
	public User getUserById(String userId) {
		String sql = "select * from spring_users where user_id = ?";
		
		return jdbcTemplate.queryForObject(sql, new UserRowMapper() , userId);
	}

	@Override
	public List<User> getAllUser() {
		String sql = "select * from spring_users";
		return jdbcTemplate.query(sql, new UserRowMapper() );
	}

	@Override
	public List<User> getUserByName(String userName) {
		String sql = "select * from spring_users where user_name = ?";
		return jdbcTemplate.query(sql, new UserRowMapper(), userName);
	}

	 class UserRowMapper implements RowMapper<User> {

		@Override
		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setPassword(rs.getString("user_password"));
			user.setEmail(rs.getString("user_email"));
			return user;
		}
	}
}
