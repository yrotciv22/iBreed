package com.ibreed_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessengerController {

    @RequestMapping("messenger")
    public String messenger(){
        return "messenger/messenger";
    }
    @RequestMapping("messenger/read")
    public String read(){
        return "messenger/read";
    }

    @RequestMapping("messenger/send")
    public String send(){
        return "messenger/send";
    }


}
