/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "teacher")
public class Teacher {

    @Id
    @Column(name = "teacherId")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int teacherId;

    @Column(name = "teacherFirstName", nullable = false, length = 50)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String teacherFirstName;

    @Column(name = "teacherLastName", nullable = false, length = 50)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String teacherLastName;

    @Column(name = "teacherAddress", nullable = false, length = 50)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String teacherAddress;

    @Column(name = "teacherCity", nullable = false, length = 50)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String teacherCity;

    @Column(name = "teacherCountry", nullable = false, length = 50)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    private String teacherCountry;

    @Column(name = "teacherPhone", nullable = false, length = 50)
    @NotNull(message = "Field required")
    @Size(min = 1, message = "Field required")
    @Pattern(regexp="^[0-9]{10}", message = "Phone numbers are 10 digits")
    private String teacherPhone;

    @Column(name = "teacherSalary", nullable = false)
    @Min(value=1, message="Salary must be a positive number")
    @Max(value=99999, message="Salary must be a positive number")
    private int teacherSalary;

    public Teacher() {
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherFirstName() {
        return teacherFirstName;
    }

    public void setTeacherFirstName(String teacherFirstName) {
        this.teacherFirstName = teacherFirstName;
    }

    public String getTeacherLastName() {
        return teacherLastName;
    }

    public void setTeacherLastName(String teacherLastName) {
        this.teacherLastName = teacherLastName;
    }

    public String getTeacherAddress() {
        return teacherAddress;
    }

    public void setTeacherAddress(String teacherAddress) {
        this.teacherAddress = teacherAddress;
    }

    public String getTeacherCity() {
        return teacherCity;
    }

    public void setTeacherCity(String teacherCity) {
        this.teacherCity = teacherCity;
    }

    public String getTeacherCountry() {
        return teacherCountry;
    }

    public void setTeacherCountry(String teacherCountry) {
        this.teacherCountry = teacherCountry;
    }

    public String getTeacherPhone() {
        return teacherPhone;
    }

    public void setTeacherPhone(String teacherPhone) {
        this.teacherPhone = teacherPhone;
    }

    public int getTeacherSalary() {
        return teacherSalary;
    }

    public void setTeacherSalary(int teacherSalary) {
        this.teacherSalary = teacherSalary;
    }

}
