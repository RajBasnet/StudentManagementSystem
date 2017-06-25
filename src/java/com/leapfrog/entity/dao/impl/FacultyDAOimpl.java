/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.entity.dao.impl;

import com.leapfrog.entity.Faculty;
import com.leapfrog.entity.dao.FacultyDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class FacultyDAOimpl implements FacultyDAO {

    private DbConnection db = new DbConnection();

    @Override
    public List<Faculty> getAll() throws ClassNotFoundException, SQLException {
        List<Faculty> facultyList = new ArrayList<>();

        String sql = "SELECT * FROM faculty";
        db.connect();
        db.initStatement(sql);

        ResultSet rs = db.query();
        while (rs.next()) {
            Faculty f = new Faculty();
            f.setId(rs.getInt("id"));
            f.setName(rs.getString("faculty_name"));
            f.setStatus(rs.getBoolean("status"));
            facultyList.add(f);
        }
        db.close();
        return facultyList;
    }

    @Override
    public int insert(Faculty faculty) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO faculty(faculty_name, status)"
                + " VALUES(?,?)";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setString(1, faculty.getName());

        stmt.setBoolean(2, faculty.isStatus());
        int result = db.update();
        db.close();

        return result;
    }

    @Override
    public int update(Faculty faculty) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE faculty set faculty_name=?, status=?"
                + " WHERE id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setString(1, faculty.getName());

        stmt.setBoolean(2, faculty.isStatus());
        stmt.setInt(3, faculty.getId());
        int result = db.update();
        db.close();

        return result;
    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        String sql = "DELETE from faculty where id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setInt(1, id);
        int result = db.update();
        db.close();

        return result;
    }

    @Override
    public Faculty getById(int id) throws ClassNotFoundException, SQLException {

        Faculty f = null;
        String sql = "SELECT * FROM Faculty where id=?";
        
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = db.query();
        if (rs.next()) {
            f = new Faculty();
            f.setId(rs.getInt("id"));
            f.setName(rs.getString("faculty_name"));
            f.setStatus(rs.getBoolean("status"));

        }
        db.close();
        return f;
    }
}
