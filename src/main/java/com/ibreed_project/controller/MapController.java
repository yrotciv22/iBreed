package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
public class MapController {

    // 클라우드 API
    @Value("${naver.cloud.map.client.id}")
    private String naverCloudMapClientId;

    // 네이버 API
    @Value("${naver.api.client-id}")
    private String naverClientId;

    @Value("${naver.api.client-secret}")
    private String naverClientSecret;

    @Value("${kakao.api.id}")
    private String kakaoApiKey;

    @RequestMapping("/map")
    public String viewMap(Model model) {
        model.addAttribute("naverMapClientId", naverCloudMapClientId);
        return "map/map";
    }

    @GetMapping(value = "/search/hospitals", produces = "application/json")
    @ResponseBody
    public String searchHospitals(@RequestParam("lat") double lat, @RequestParam("lng") double lng, @RequestParam("map_name") String mapName) {
        String apiUrl = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" + mapName + "&x=" + lng + "&y=" + lat + "&radius=2000&size=15";

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + kakaoApiKey);  // API 키를 헤더에 추가

        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

        return response.getBody();  // JSON 형태로 클라이언트에 반환
    }

    @GetMapping(value = "/search/address", produces = "application/json")
    @ResponseBody
    public String searchAddress(@RequestParam("query") String query) {
        String addressApiUrl = "https://dapi.kakao.com/v2/local/search/address.json?query=" + query;
        String keywordApiUrl = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" + query;

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + kakaoApiKey);  // API 키를 헤더에 추가

        HttpEntity<String> entity = new HttpEntity<>(headers);

        // 1. 주소 검색 시도
        ResponseEntity<String> addressResponse = restTemplate.exchange(addressApiUrl, HttpMethod.GET, entity, String.class);
        String addressResponseBody = addressResponse.getBody();

        // 주소 검색 결과 확인
        if (addressResponseBody != null && !addressResponseBody.contains("\"documents\":[]")) {
            return addressResponseBody;  // 주소 검색 결과 반환
        }

        // 2. 주소 검색 결과가 없을 경우 키워드 검색 시도
        ResponseEntity<String> keywordResponse = restTemplate.exchange(keywordApiUrl, HttpMethod.GET, entity, String.class);
        return keywordResponse.getBody();  // 키워드 검색 결과 반환
    }





    @GetMapping("/locationPopup")
    public String showLocationPopup(Model model) {
        model.addAttribute("naverMapClientId", naverCloudMapClientId);
        return "map/locationPopup";
    }
}
