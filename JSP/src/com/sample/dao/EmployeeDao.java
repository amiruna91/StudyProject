package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.util.ConnectionUtil;
import com.sample.vo.Employee;

public class EmployeeDao {

	/**
	 * 모든 사원정보를 반환한다.
	 * @return 모든 사원정보
	 * @throws SQLException
	 */
	public List<Employee> getAllEmployees() throws SQLException {
		List<Employee> employees = new ArrayList<Employee>();
		
		String sql = "select A.employee_id, A.first_name, A.last_name, A.job_id "
				+ "	 		, B.department_id, B.department_name "
				+ "from employees A, departments B "
				+ "where A.department_id = B.department_id(+) "
				+ "order by A.employee_id asc";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Employee employee = new Employee();
			
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setJobId(rs.getString("job_id"));
			employee.setDepartmentId(rs.getInt("department_id"));
			employee.setDepartmentName(rs.getString("department_name"));
			
			employees.add(employee);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employees;
	}
	
	/**
	 * 지정된 범위내의 사원정보를 반환한다.
	 * @param beginNumber 시작순번
	 * @param endNumber 끝 순번
	 * @return 사원정보들
	 * @throws SQLException
	 */
	public List<Employee> getEmployeesByRange(int beginNumber, int endNumber) throws SQLException {
		List<Employee> employees = new ArrayList<Employee>();
		
		String sql = "select a.employee_id, a.first_name, a.last_name, a.email, A.phone_number " 
						+ ", A.hire_date, A.job_id, A.salary, a.commission_pct "
						+ ", c.employee_id manager_id, c.first_name manager_first_name, C.last_name manager_last_name "
						+ ", B.department_id, B.department_name "
					+ "from (select employee_id, first_name, last_name, email, phone_number "
								+ ", hire_date, job_id, salary, commission_pct, manager_id, department_id "
								+ ", row_number() over(order by employee_id asc) rownumber "
						 + "from employees) A, departments B, employees C "
	                + "where a.rownumber >= ? and a.rownumber <= ? "
	                + "and A.department_id = B.department_id(+) "
	                + "and A.manager_id = C.employee_id(+)";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Employee emp = new Employee();
			emp.setId(rs.getInt("employee_id"));
			emp.setFirstName(rs.getString("first_name"));
			emp.setLastName(rs.getString("last_name"));
			emp.setEmail(rs.getString("email"));
			emp.setPhoneNumber(rs.getString("phone_number"));
			emp.setHireDate(rs.getDate("hire_date"));
			emp.setJobId(rs.getString("job_id"));
			emp.setSalary(rs.getDouble("salary"));
			emp.setCommissionPct(rs.getDouble("commission_pct"));
			emp.setManagerId(rs.getInt("manager_id"));
			emp.setManagerFirstName(rs.getString("manager_first_name"));
			emp.setManagerLastName(rs.getString("manager_last_name"));
			emp.setDepartmentId(rs.getInt("department_id"));
			emp.setDepartmentName(rs.getString("department_name"));
			
			employees.add(emp);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employees;
	}
	
	public int getEmployeesCount() throws SQLException {
		int rowCount = 0;
		
		String sql = "select count(*) cnt from employees";
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		rowCount = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return rowCount;
	}
	
	/**
	 * 지정된 사원번호에 해당하는 사원의 상세정보를 반환한다.
	 * @param employeeId 조회할 사원번호
	 * @return 사원번호에 해당하는 사원이 존재하지 않는 경우 null반환됨
	 * @throws SQLException
	 */
	public Employee getEmployeeById(int employeeId) throws SQLException {
		Employee emp= null;
		
		String sql = "select a.employee_id, a.first_name, a.last_name, a.email, A.phone_number " 
				+ ", A.hire_date, A.job_id, A.salary, a.commission_pct "
				+ ", c.employee_id manager_id, c.first_name manager_first_name, C.last_name manager_last_name "
				+ ", B.department_id, B.department_name "
			+ "from employees A, departments B, employees C "
            + "where A.employee_id = ? "
            + "and A.department_id = B.department_id(+) "
            + "and A.manager_id = C.employee_id(+)";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, employeeId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			emp = new Employee();
			emp.setId(rs.getInt("employee_id"));
			emp.setFirstName(rs.getString("first_name"));
			emp.setLastName(rs.getString("last_name"));
			emp.setEmail(rs.getString("email"));
			emp.setPhoneNumber(rs.getString("phone_number"));
			emp.setHireDate(rs.getDate("hire_date"));
			emp.setJobId(rs.getString("job_id"));
			emp.setSalary(rs.getDouble("salary"));
			emp.setCommissionPct(rs.getDouble("commission_pct"));
			emp.setManagerId(rs.getInt("manager_id"));
			emp.setManagerFirstName(rs.getString("manager_first_name"));
			emp.setManagerLastName(rs.getString("manager_last_name"));
			emp.setDepartmentId(rs.getInt("department_id"));
			emp.setDepartmentName(rs.getString("department_name"));
			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return emp;
	}
}
