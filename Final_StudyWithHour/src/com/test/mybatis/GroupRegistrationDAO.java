package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupRegistrationDAO 
{

    @Autowired
    private SqlSession sqlSession;

    public int insertGroupRegistration(BoardStudyGroupDTO group) 
    {
        int result = 0;
        try 
        {
            result = sqlSession.insert("com.test.mybatis.mapper.insertGroupRegistration", group);
        } catch (Exception e) 
        {
            e.printStackTrace();
        }
        return result;
    }
}