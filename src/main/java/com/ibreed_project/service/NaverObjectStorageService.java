package com.ibreed_project.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class NaverObjectStorageService {

	// upload local file
	public String uploadFile(MultipartFile file) {

		System.out.println("[Naver] NaverObjectStorageService");
		System.out.println("[Naver] filePath= " + file);

		// 버킷 생성 
		final String endPoint = "https://kr.object.ncloudstorage.com";
		final String regionName = "kr-standard";
		final String accessKey = "ncp_iam_BPASKR4XKVgJ9B7exiwM";
		final String secretKey = "ncp_iam_BPKSKRVByyDVtT7HSDwPk6y0FPJoDLgV7o";

		// S3 client
		final AmazonS3 s3 = AmazonS3ClientBuilder.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
				.build();
		String bucketName = "ibreed-profile-image";

		  File tempFile = null;
		//create folder
		// String folderName = "mydiary-home/";

		/*
		 * ObjectMetadata objectMetadata = new ObjectMetadata();
		 * objectMetadata.setContentLength(0L);
		 * objectMetadata.setContentType("application/x-directory"); PutObjectRequest
		 * putObjectRequest = new PutObjectRequest(bucketName, folderName, new
		 * ByteArrayInputStream(new byte[0]), objectMetadata);
		 * 
		 * try { s3.putObject(putObjectRequest);
		 * System.out.format("Folder %s has been created.\n", folderName); } catch
		 * (AmazonS3Exception e) { e.printStackTrace(); } catch (SdkClientException e) {
		 * e.printStackTrace(); }
		 * 
		 * //upload local file String objectName = "mydiary-home";
		 */

		// Extract file name from the file path
		//File file = new File(file);
	//	System.out.println("[Naver] file= " + file);
		//String objectName = "mydiary-home/" + file.getName(); // Use the file name in object path

	
		  String fileUrl ="";
		  try {
	            // MultipartFile을 임시 파일로 변환
	            tempFile = File.createTempFile("profile_image", ".png");
	            file.transferTo(tempFile);

	            String objectName = "mydiary-home/" + tempFile.getName();
	            
	            s3.putObject(new PutObjectRequest(bucketName, objectName, tempFile)
	                    .withCannedAcl(CannedAccessControlList.PublicRead));

	            fileUrl = String.format("https://%s.%s/%s", bucketName, endPoint.replace("https://", ""),
	                    objectName);
	            System.out.println("[Naver] fileUrl: " + fileUrl);
	            return fileUrl;

	        } catch (IOException | SdkClientException e) {
	            e.printStackTrace();
	        } finally {
	            if (tempFile != null && tempFile.exists()) {
	                tempFile.delete();
	            }
	        }
		return fileUrl;
	}

}