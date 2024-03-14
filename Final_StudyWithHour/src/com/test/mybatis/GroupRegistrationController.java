package com.test.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupRegistrationController {

    @Autowired
    private GroupRegistrationDAO groupRegistrationDAO;

    @RequestMapping("/groupregistration")
    public String registerGroup(@RequestBody BoardStudyGroupDTO group) 
    {
        int result = groupRegistrationDAO.insertGroupRegistration(group);
        if (result > 0) 
        {
            return "스터디 그룹 개설이 완료되었습니다.";
        } 
        else 
        {
            return "스터디 그룹 개설에 실패했습니다.";
        }
    }
}