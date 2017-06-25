/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.entity.dao.impl;

import com.leapfrog.entity.Course;
import com.leapfrog.entity.dao.CourseDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CourseDAOimpl implements CourseDAO {

    private DbConnection db = new DbConnection();

    @Override
    public List<Course> getAll() throws ClassNotFoundException, SQLException {
        List<Course> courseList = new ArrayList<>();

        String sql = "SELECT * from course";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        ResultSet rs = db.query();
        while (rs.next()) {
            Course c = new Course();
            c.setId(rs.getInt("id"));

            c.setName(rs.getString("course_name"));
            c.setCode(rs.getString("course_code"));
            c.setStatus(rs.getBoolean("status"));

            courseList.add(c);
        }

        db.close();

        return courseList;
    }

    @Override
    public int insert(Course course) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO course(course_name,course_code,status)"
                + " VALUES(?,?,?)";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setString(1, course.getName());

        stmt.setString(2, course.getCode());
        stmt.setBoolean(3, course.isStatus());

        int result = db.update();
        db.close();

        return result;
    }

    @Override
    public int update(Course course) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE course set course_name=?,course_code=?,status=?"
                + " WHERE id=?";

        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setString(1, course.getName());
        stmt.setString(2, course.getCode());
        stmt.setBoolean(3, course.isStatus());
        stmt.setInt(4, course.getId());

        int result = db.update();
        db.close();

        return result;

    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM course WHERE id=?";

        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        
        stmt.setInt(1, id);

        int result = db.update();
        db.close();

        return result;
    }

    @Override
    public Course getById(int id) throws ClassNotFoundException, SQLException {

        Course c = null;
        String sql = " SELECT * FROM course WHERE id=?";

        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setInt(1, id);

        ResultSet rs = db.query();
        if (rs.next()) {
            c = new Course();
            c.setId(rs.getInt("id"));

            c.setName(rs.getString("course_name"));
            c.setCode(rs.getString("course_code"));
            c.setStatus(rs.getBoolean("status"));
        }
        db.close();
        return c;

    }
}
