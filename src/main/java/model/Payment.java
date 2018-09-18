/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.time.LocalDateTime;
import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CreationTimestamp;


@Entity
@Table(name = "payment")
public class Payment {
    
    @Id
    @Column(name = "paymentId")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer paymentId;    
    
    @Column(name="paymentAmount") 
    @NotNull(message="Field required") 
    private Integer paymentAmount;


    @Column(name = "paymentDate", nullable = false)
    private Date paymentDate;
  
    @ManyToOne  
    @JoinColumn(name = "paymentStudentId")
    @NotNull(message="Field required")    
    private Student paymentStudent;



    
    public Payment() {
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Integer getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(Integer paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Student getPaymentStudent() {
        return paymentStudent;
    }

    public void setPaymentStudent(Student paymentStudent) {
        this.paymentStudent = paymentStudent;
    }



    
    
}
