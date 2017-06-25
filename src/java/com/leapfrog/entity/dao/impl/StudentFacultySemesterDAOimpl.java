/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.entity.dao.impl;

import com.leapfrog.entity.Faculty;
import com.leapfrog.entity.Student;
import com.leapfrog.entity.StudentFacultySemester;
import com.leapfrog.entity.dao.StudentFacultySemesterDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class StudentFacultySemesterDAOimpl implements StudentFacultySemesterDAO {

    private DbConnection db = new DbConnection();

    @Override
    public List<StudentFacultySemester> getAll() throws ClassNotFoundException, SQLException {

        List<StudentFacultySemester> sfsList = new ArrayList<>();

        String sql = "SELECT * FROM Faculty";
        db.connect();
        db.initStatement(sql);

        ResultSet rs = db.query();
        while (rs.next()) {
            StudentFacultySemester sfs = new StudentFacultySemester();
            sfs.setId(rs.getInt("id"));
            
            Faculty faculty = new Faculty();
            faculty.setId(rs.getInt("faculty_id"));
            sfs.setFaculty(faculty);
            Student student = new Student();
            student.setId(rs.getInt("student_id"));
            sfs.setStudent(student);

            sfs.setStatus(rs.getBoolean("status"));
            sfsList.add(sfs);
        }
        return sfsList;
    }

    @Override
    public int insert(StudentFacultySemester t) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(StudentFacultySemester t) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public StudentFacultySemester getById(int id) throws ClassNotFoundException, SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
