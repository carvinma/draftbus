package com.bteplus.draftbus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeContrller {

    @RequestMapping(value="/{id}")
    public String index(HttpServletRequest request, Model model,@PathVariable Integer id){


        return "/index";
    }
}
