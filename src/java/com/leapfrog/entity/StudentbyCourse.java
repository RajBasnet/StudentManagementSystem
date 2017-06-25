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
public class StudentbyCourse {

    private int id;
    private Student Student;
    private Course Course;
    private Date EnrollDate;
    private boolean status;

    public StudentbyCourse() {
    }

    public StudentbyCourse(int id, Student Student, Course Course, boolean status) {
        this.id = id;
        this.Student = Student;
        this.Course = Course;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return Student;
    }

    public void setStudent(Student Student) {
        this.Student = Student;
    }

    public Course getCourse() {
        return Course;
    }

    public void setCourse(Course Course) {
        this.Course = Course;
    }

    public Date getEnrollDate() {
        return EnrollDate;
    }

    public void setEnrollDate(Date EnrollDate) {
        this.EnrollDate = EnrollDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
