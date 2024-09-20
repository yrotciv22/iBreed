package com.ibreed_project.service;

import java.util.ArrayList;

import com.ibreed_project.model.PostVO;

public interface IPostService {

	public ArrayList<PostVO> postSearch(String keyword);

	public int postSearchCount(String keyword);

}
