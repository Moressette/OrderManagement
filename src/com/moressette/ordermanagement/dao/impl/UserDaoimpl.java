package com.moressette.ordermanagement.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.moressette.ordermanagement.DataSource.ConnectionManager;
import com.moressette.ordermanagement.DataSource.SQLManager;
import com.moressette.ordermanagement.dao.UserDao;
import com.moressette.ordermanagment.entity.User;
import com.mysql.jdbc.Connection;

public class UserDaoimpl implements UserDao {
	ConnectionManager connectionManager = new ConnectionManager();
	Connection connection = (Connection) connectionManager.openConnection();
	SQLManager sqlManager = new SQLManager();
	
	
	public User login(User user){
		String username = user.getUsername();
		String password = user.getPassword();
		String strSQL = "select * from users where username=? and password=?";
		Object[] params = { username , password };
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		try {
			User u = new User();
			if (rs.next()) {
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getInt("role"));
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
}
