package cn.test.service;

import cn.test.dao.StudentDao;
import cn.test.domain.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("StudentService")
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;
    @Override
    public List<Student> findAll() {

        System.out.println("执行findall方法。。");
        return  studentDao.findAll();
    }

    @Override
    public void insertOne(Student s) {
        System.out.println("执行insertOne方法。。");
         studentDao.insertOne(s);
    }

    @Override
    public void updateOne(Student s) {
        System.out.println("updateOne。。");
        studentDao.upateOne(s);
    }

    @Override
    public Student selectOne(Student student) {
        Student s = studentDao.selectOne(student);
        if(s==null) {
            System.out.println(s);
            return null;
        }
        else
            return s;
    }

    @Override
    public String selectemail(String email) {
        String s = studentDao.selectemail(email);
        if(null!=s) return s;
        else
        return null;
    }

    @Override
    public Student selectId(String student_Id) {
        return studentDao.selectId(student_Id);

    }
}
