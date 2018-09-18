/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import model.Payment;

/**
 *
 * @author armando
 */
public interface PaymentService {
    
    public void addPayment (Payment payment);
    public void editPayment (Payment payment);
    public List<Payment> listPayments();
    public Payment getPaymentById(int paymentId);
    public List<Payment> listPaymentByStudent(int studentId);
    public void deletePayment(Payment payment);
}
