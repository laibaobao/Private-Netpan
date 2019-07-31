package cn.test.service;

import cn.test.domain.Student;

import java.util.List;

public interface StudentService {
    public List<Student> findAll();
    public Student selectOne(Student student);
    public Student selectId(String student_Id);
    public String selectemail(String email);
    public void insertOne(Student s);
    public void updateOne(Student s);
}
