/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.entity.dao;

import com.leapfrog.entity.StudentbyFaculty;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Dell
 */
public interface StudentbyFacultyDAO extends GenericDAO<StudentbyFaculty> {

    List<StudentbyFaculty> getAll1() throws ClassNotFoundException, SQLException;

    List<StudentbyFaculty> getAll2(int id) throws ClassNotFoundException, SQLException;
}
