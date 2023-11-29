package com.example.demo.firebase;


import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;

import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;
import com.google.cloud.storage.StorageOptions;
import java.util.HashMap;
import java.util.Map;

@Service
public class FirebaseFileService {

    private Storage storage;

	public String saveTest(MultipartFile file) throws IOException{
		ClassPathResource serviceAccount = new ClassPathResource("firebaseconfig.json");
        storage = StorageOptions.newBuilder().
                setCredentials(GoogleCredentials.fromStream(serviceAccount.getInputStream())).
                setProjectId("webshop-b4e27").build().getService();
        String imageName = generateFileName(file.getOriginalFilename());
        Map<String, String> map = new HashMap<>();
        map.put("firebaseStorageDownloadTokens", imageName);
        BlobId blobId = BlobId.of("webshop-b4e27.appspot.com", imageName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                .setMetadata(map)
                .setContentType(file.getContentType())
                .build();
        
		storage.create(blobInfo, file.getInputStream());
		
        return imageName;
    }
	
	public String update(MultipartFile file,String key) throws IOException{
		ClassPathResource serviceAccount = new ClassPathResource("firebaseconfig.json");
        storage = StorageOptions.newBuilder().
                setCredentials(GoogleCredentials.fromStream(serviceAccount.getInputStream())).
                setProjectId("webshop-b4e27").build().getService();
        
        Map<String, String> map = new HashMap<>();
        map.put("firebaseStorageDownloadTokens", key);
        BlobId blobId = BlobId.of("webshop-b4e27.appspot.com", key);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                .setMetadata(map)
                .setContentType(file.getContentType())
                .build();
        
		storage.create(blobInfo, file.getInputStream());
		
        return key;
    }
	
    private String generateFileName(String originalFileName) {
        return UUID.randomUUID().toString() + "." + getExtension(originalFileName);
    }

    private String getExtension(String originalFileName) {
        return StringUtils.getFilenameExtension(originalFileName);
    }
}
