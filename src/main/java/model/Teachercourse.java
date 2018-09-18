/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "teachercourse")
public class Teachercourse {

    @Id
    @Column(name = "teachercourseId")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer teachercourseId;

    @ManyToOne
    @JoinColumn(name = "teachercourseTeacherId")
    @NotNull(message = "Field required")
    private Teacher teachercourseTeacher;

    @ManyToOne
    @JoinColumn(name = "teachercourseCourseId")
    @NotNull(message = "Field required")
    private Course teachercourseCourse;

    public Teachercourse() {
    }

    public Integer getTeachercourseId() {
        return teachercourseId;
    }

    public void setTeachercourseId(Integer teachercourseId) {
        this.teachercourseId = teachercourseId;
    }

    public Teacher getTeachercourseTeacher() {
        return teachercourseTeacher;
    }

    public void setTeachercourseTeacher(Teacher teachercourseTeacher) {
        this.teachercourseTeacher = teachercourseTeacher;
    }

    public Course getTeachercourseCourse() {
        return teachercourseCourse;
    }

    public void setTeachercourseCourse(Course teachercourseCourse) {
        this.teachercourseCourse = teachercourseCourse;
    }

}
