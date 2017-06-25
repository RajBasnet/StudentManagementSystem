/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.entity.dao.impl;

import com.leapfrog.entity.Course;
import com.leapfrog.entity.Student;
import com.leapfrog.entity.StudentbyCourse;
import com.leapfrog.entity.dao.StudentbyCourseDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class StudentbyCourseDAOimpl implements StudentbyCourseDAO {

    private DbConnection db = new DbConnection();

    @Override
    public List<StudentbyCourse> getAll1() throws ClassNotFoundException, SQLException {

        List<StudentbyCourse> scList = new ArrayList<>();

        String sql = "SELECT s.*,c.*,sc.* FROM studentbycourse sc"
                + " JOIN course c on c.id=sc.course_id"
                + " JOIN student s on s.id=sc.student_id"
                + " WHERE sc.course_id=?";

        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setInt(1, 1);

        ResultSet rs = db.query();

        while (rs.next()) {
            StudentbyCourse sc = new StudentbyCourse();
            sc.setId(rs.getInt("id"));
            sc.setEnrollDate(rs.getDate("enroll_date"));

            Course c = new Course();
            c.setId(rs.getInt("course_id"));
            c.setName(rs.getString("course_name"));
            sc.setCourse(c);

            Student s = new Student();
            s.setId(rs.getInt("student_id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            sc.setStudent(s);

            scList.add(sc);
        }

        return scList;
    }

    @Override
    public List<StudentbyCourse> getAll2(int id) throws ClassNotFoundException, SQLException {
        List<StudentbyCourse> scList = new ArrayList<>();

        String sql = "SELECT s.*,c.*,sc.* FROM studentbycourse sc"
                + " JOIN course c on c.id=sc.course_id"
                + " JOIN student s on s.id=sc.student_id"
                + " WHERE sc.course_id=?";

        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setInt(1, id);

        ResultSet rs = db.query();

        while (rs.next()) {
            StudentbyCourse sc = new StudentbyCourse();
            sc.setId(rs.getInt("id"));
            sc.setEnrollDate(rs.getDate("enroll_date"));

            Course c = new Course();
            c.setId(rs.getInt("course_id"));
            c.setName(rs.getString("course_name"));
            sc.setCourse(c);

            Student s = new Student();
            s.setId(rs.getInt("student_id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            sc.setStudent(s);

            scList.add(sc);
        }

        return scList;
    }

    @Override
    public int insert(StudentbyCourse sc) throws ClassNotFoundException, SQLException {
        String sql = "INSERT into studentbycourse(course_id,student_id)"
                + " VALUES(?,?)";

        db.connect();

        PreparedStatement stmt = db.initStatement(sql);

        stmt.setInt(1, sc.getCourse().getId());
        stmt.setInt(2, sc.getStudent().getId());

        int result = db.update();
        db.close();
        return result;
    }

    @Override
    public int update(StudentbyCourse t) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<StudentbyCourse> getAll() throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public StudentbyCourse getById(int id) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
