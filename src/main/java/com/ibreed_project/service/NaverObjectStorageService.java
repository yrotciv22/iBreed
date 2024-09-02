package com.ibreed_project.service;

import java.io.ByteArrayInputStream;
import java.io.File;

import org.springframework.stereotype.Service;

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
	public String uploadFile(String filePath) {
		
		System.out.println("NaverObjectStorageService uploadFile");
		System.out.println("filePath");

		// filePath = "C:/Users/BOK/Desktop/images.png";
		
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
		 * 
		 * //upload local file String objectName = "mydiary-home";
		 */
		
	    // Extract file name from the file path
        File file = new File(filePath);
        String objectName = "mydiary-home/" + file.getName(); // Use the file name in object path

		try {
			// s3.putObject(bucketName, objectName, new File(filePath));
			// 아래 수정
		      s3.putObject(new PutObjectRequest(bucketName, objectName, file)
	                    .withCannedAcl(CannedAccessControlList.PublicRead)); // Make the file publicly accessible
			System.out.format("Object %s has been created.\n", objectName);
			
			 // Return the file's URL after upload
          String fileUrl = String.format("https://%s.%s/%s", bucketName, endPoint.replace("https://", ""), objectName);
          
          System.out.format("Naver fileUrl", fileUrl);
          return fileUrl;
		} catch (AmazonS3Exception e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}

		return "File upload success";
	}

}