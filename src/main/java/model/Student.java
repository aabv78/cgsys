/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author armando
 */
@Entity
@Table(name = "student")
public class Student {

    @Id
    @Column(name = "studentId")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int studentId;
    
   
    
    @Column(name = "studentFirstName", nullable = false, length = 30)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String studentFirstName;

    @Column(name = "studentLastName", nullable = false, length = 30)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String studentLastName;

    @Column(name = "studentOrganization", nullable = false, length = 100)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String studentOrganization;

    @Column(name = "studentAddress", nullable = false, length = 100)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String studentAddress;

    @Column(name = "studentCity", nullable = false, length = 30)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String studentCity;

    @Column(name = "studentState", nullable = false, length = 30)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String studentState;

    @Column(name = "studentCountry", nullable = false, length = 30)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String studentCountry;

    @Column(name = "studentPhone", nullable = false, length = 10)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    @Pattern(regexp="^[0-9]{10}", message = "Phone numbers are 10 digits")
    private String studentPhone;

    @Column(name = "studentEmail", nullable = false, length = 30)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    @Pattern(regexp="^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", message = "Invalid email")
    private String studentEmail;

    @Column(name = "studentGender", nullable = false, length = 1)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String studentGender;

    @Column(name = "studentBirthday", nullable = false)
    private Date studentBirthday;

    public Student() {
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentFirstName() {
        return studentFirstName;
    }

    public void setStudentFirstName(String studentFirstName) {
        this.studentFirstName = studentFirstName;
    }

    public String getStudentLastName() {
        return studentLastName;
    }

    public void setStudentLastName(String studentLastName) {
        this.studentLastName = studentLastName;
    }

    public String getStudentOrganization() {
        return studentOrganization;
    }

    public void setStudentOrganization(String studentOrganization) {
        this.studentOrganization = studentOrganization;
    }

    public String getStudentAddress() {
        return studentAddress;
    }

    public void setStudentAddress(String studentAddress) {
        this.studentAddress = studentAddress;
    }

    public String getStudentCity() {
        return studentCity;
    }

    public void setStudentCity(String studentCity) {
        this.studentCity = studentCity;
    }

    public String getStudentState() {
        return studentState;
    }

    public void setStudentState(String studentState) {
        this.studentState = studentState;
    }

    public String getStudentCountry() {
        return studentCountry;
    }

    public void setStudentCountry(String studentCountry) {
        this.studentCountry = studentCountry;
    }

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getStudentGender() {
        return studentGender;
    }

    public void setStudentGender(String studentGender) {
        this.studentGender = studentGender;
    }

    public Date getStudentBirthday() {
        return studentBirthday;
    }

    public void setStudentBirthday(Date studentBirthday) {
        this.studentBirthday = studentBirthday;
    }

}
