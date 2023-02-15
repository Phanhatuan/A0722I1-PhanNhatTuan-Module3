package com.example.thuchanh.dao;

import com.example.thuchanh.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
     void insertUser(User user) throws SQLException;

     User selectUser(int id);

     List<User> selectAllUsers();

     boolean deleteUser(int id) throws SQLException;

     boolean updateUser(User user) throws SQLException;

     List<User> displayByProcedure() throws SQLException;

     boolean editUserProcedure(User user) throws SQLException;

     void deleteUserProcedure(int id) throws SQLException;
     void addUserTransaction(User user, int[] permision);
}
