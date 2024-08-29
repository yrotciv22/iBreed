/*
 * package com.ibreed_project.service;
 * 
 * import java.io.IOException;
 * 
 * import org.springframework.beans.factory.annotation.Value; import
 * org.springframework.stereotype.Service; import
 * org.springframework.web.multipart.MultipartFile;
 * 
 * import com.amazonaws.auth.AWSStaticCredentialsProvider; import
 * com.amazonaws.auth.BasicAWSCredentials; import
 * com.amazonaws.services.s3.AmazonS3; import
 * com.amazonaws.services.s3.AmazonS3ClientBuilder; import
 * com.amazonaws.services.s3.model.CannedAccessControlList; import
 * com.amazonaws.services.s3.model.PutObjectRequest;
 * 
 * @Service public class NaverObjectStorageService {
 * 
 * private final AmazonS3 s3Client;
 * 
 * @Value("${ncp.s3.bucket-name}") private String bucketName =
 * "ibreed-profile-image";
 * 
 * public NaverObjectStorageService(
 * 
 * @Value("${ncp.s3.access-key}") String accessKey,
 * 
 * @Value("${ncp.s3.secret-key}") String secretKey,
 * 
 * @Value("${ncp.s3.region}") String region) {
 * 
 * BasicAWSCredentials awsCreds = new BasicAWSCredentials(accessKey, secretKey);
 * 
 * this.s3Client = AmazonS3ClientBuilder.standard()
 * .withEndpointConfiguration(new AmazonS3ClientBuilder.EndpointConfiguration(
 * "https://kr.object.ncloudstorage.com", region)) .withCredentials(new
 * AWSStaticCredentialsProvider(awsCreds)) .withPathStyleAccessEnabled(true) //
 * path-style 접근을 사용해야 Naver Object Storage와 호환됨 .build(); }
 * 
 * public String uploadFile(MultipartFile file) throws IOException { String
 * fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
 * s3Client.putObject(new PutObjectRequest(bucketName, fileName,
 * file.getInputStream(), null)
 * .withCannedAcl(CannedAccessControlList.PublicRead)); // Public read 접근 권한 설정
 * 
 * return s3Client.getUrl(bucketName, fileName).toString(); // 업로드된 파일의 URL 반환 }
 * 
 * }
 */