package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {

    @RequestMapping("/map")
    public String viewMap() {
        return "map/map";
    }

    @Value("${naver.map.client.id}")
    private String naverMapClientId;

    @GetMapping("/locationPopup")
    public String showLocationPopup(Model model) {
        model.addAttribute("naverMapClientId", naverMapClientId);
        return "map/locationPopup";
    }
}


