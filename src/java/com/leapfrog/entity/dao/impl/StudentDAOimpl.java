/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.entity.dao.impl;

import com.leapfrog.entity.Student;
import com.leapfrog.entity.dao.StudentDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class StudentDAOimpl implements StudentDAO {

    private DbConnection db = new DbConnection();

    @Override
    public List<Student> getAll() throws ClassNotFoundException, SQLException {
        List<Student> studentList = new ArrayList<>();

        String sql = "SELECT * FROM student";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        ResultSet rs = db.query();
        while (rs.next()) {
            Student s = new Student();
            s.setId(rs.getInt("id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            s.setStatus(rs.getBoolean("status"));
            studentList.add(s);
        }
        db.close();
        return studentList;
    }

    @Override
    public int insert(Student student) throws ClassNotFoundException, SQLException {

        String sql = "INSERT INTO student(first_name,last_name,status)" + " VALUES(?,?,?)";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setString(1, student.getFirstName());
        stmt.setString(2, student.getLastName());
        stmt.setBoolean(3, student.isStatus());
        int result = db.update();
        db.close();

        return result;
    }

    @Override
    public int update(Student student) throws ClassNotFoundException, SQLException {

        String sql = "UPDATE student set first_name=?,last_name=?,status=?"
                + " WHERE id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setString(1, student.getFirstName());
        stmt.setString(2, student.getLastName());
        stmt.setBoolean(3, student.isStatus());
        stmt.setInt(4, student.getId());

        int result = db.update();

        db.close();
        return result;

    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        String sql = "DELETE from student WHERE id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        
        stmt.setInt(1, id);

        int result = db.update();

        db.close();
        return result;
    }

    @Override
    public Student getById(int id) throws ClassNotFoundException, SQLException {
        Student s = null;
        String sql = "SELECT * FROM student WHERE id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = db.query();
        if (rs.next()) {
            s = new Student();
            s.setId(rs.getInt("id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            s.setStatus(rs.getBoolean("status"));

        }
        db.close();
        return s;
    }

}
