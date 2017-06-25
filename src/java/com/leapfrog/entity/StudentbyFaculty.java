/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.entity;

import java.util.Date;

/**
 *
 * @author Dell
 */
public class StudentbyFaculty {

    private int id;
    private Student student;
    private Faculty faculty;
    private Date joinDate;
    

    public StudentbyFaculty() {
    }

    public StudentbyFaculty(int id, Student student, Faculty faculty, boolean status) {
        this.id = id;
        this.student = student;
        this.faculty = faculty;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    
    
    

}
