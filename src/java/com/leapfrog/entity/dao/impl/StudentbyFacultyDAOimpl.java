/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.entity.dao.impl;

import com.leapfrog.entity.Faculty;
import com.leapfrog.entity.Student;
import com.leapfrog.entity.StudentbyFaculty;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.leapfrog.entity.dao.StudentbyFacultyDAO;
import java.sql.PreparedStatement;

/**
 *
 * @author Dell
 */
public class StudentbyFacultyDAOimpl implements StudentbyFacultyDAO {

    private DbConnection db = new DbConnection();

    @Override
    public List<StudentbyFaculty> getAll1() throws ClassNotFoundException, SQLException {
        List<StudentbyFaculty> sfList = new ArrayList<>();

        String sql = "SELECT s.*,f.*,sf.* FROM studentbyfaculty sf"
                + " JOIN faculty f on f.id=sf.faculty_id"
                + " JOIN student s on s.id=sf.student_id"
                + " WHERE sf.faculty_id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        
            stmt.setInt(1, 1);

            ResultSet rs = db.query();
            while (rs.next()) {
                StudentbyFaculty sf = new StudentbyFaculty();
                sf.setId(rs.getInt("id"));
                sf.setJoinDate(rs.getDate("join_date"));

                Faculty f = new Faculty();
                f.setId(rs.getInt("faculty_id"));
                f.setName(rs.getString("faculty_name"));
                sf.setFaculty(f);

                Student s = new Student();
                s.setId(rs.getInt("student_id"));
                s.setFirstName(rs.getString("first_name"));
                s.setLastName(rs.getString("last_name"));
                sf.setStudent(s);

                sfList.add(sf);
            }
        
        return sfList;

    }

    @Override
    public List<StudentbyFaculty> getAll2(int id) throws ClassNotFoundException, SQLException {

        List<StudentbyFaculty> sfList = new ArrayList<>();

        db.connect();
        String sql = "SELECT s.*,f.*,sf.* FROM studentbyfaculty sf"
                + " JOIN faculty f on f.id=sf.faculty_id"
                + " JOIN student s on s.id=sf.student_id"
                + " WHERE sf.faculty_id=?";

        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = db.query();
        while (rs.next()) {

            StudentbyFaculty sf = new StudentbyFaculty();
            sf.setId(rs.getInt("id"));
            sf.setJoinDate(rs.getDate("join_date"));

            Faculty f = new Faculty();
            f.setId(rs.getInt("faculty_id"));
            f.setName(rs.getString("faculty_name"));
            sf.setFaculty(f);

            Student s = new Student();
            s.setId(rs.getInt("student_id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            sf.setStudent(s);

            sfList.add(sf);
        }

        return sfList;

    }

    @Override
    public int insert(StudentbyFaculty sf) throws ClassNotFoundException, SQLException {
        
        String sql= "INSERT into studentbyfaculty(faculty_id,student_id)"
                + " VALUES(?,?)";
        
        db.connect();
        
        PreparedStatement stmt=db.initStatement(sql);
        
        stmt.setInt(1, sf.getFaculty().getId());
        stmt.setInt(2, sf.getStudent().getId());
        
        int result=db.update();
        db.close();
        return result;
    }

    @Override
    public int update(StudentbyFaculty t) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public StudentbyFaculty getById(int id) throws ClassNotFoundException, SQLException {

        /*StudentbyFaculty sf = null;
        String sql = "SELECT s.*,f.*,sf.* FROM studentbyfaculty sf"
                + " JOIN faculty f on f.id=sf.faculty_id"
                + " JOIN student s on s.id=sf.student_id"
                + " WHERE sf.faculty_id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = db.query();
        while (rs.next()) {

            sf = new StudentbyFaculty();
            sf.setId(rs.getInt("sf.id"));

            Faculty f = new Faculty();
            f.setId(rs.getInt("f.faculty_id"));
            sf.setFaculty(f);
            f.setName(rs.getString("f.faculty_name"));
            sf.setFaculty(f);

            Student s = new Student();
            s.setId(rs.getInt("s.student_id"));
            sf.setStudent(s);
            s.setFirstName(rs.getString("s.first_name"));

            s.setLastName(rs.getString("s.last_name"));
            sf.setStudent(s);

            sf.setJoinDate(rs.getDate("s.join_date"));

        }
        db.close();*/
        return null;
    }

    @Override
    public List<StudentbyFaculty> getAll() throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
