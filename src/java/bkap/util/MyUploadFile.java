/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.util;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author asuspc
 */
public class MyUploadFile {
    private static  final String URI_FOLDER = "/jsp";
    private static final String URI_DB = "../jsp/images/";
    private static final String URI_WRITE = "\\web\\jsp\\images\\";
    
    public String saveImageToFolder(HttpServletRequest request, MultipartFile multi,String file)
    {
        String uriDBSave = null;
        try {
            String path = request.getRealPath(URI_FOLDER);
            
            path = path.substring(0, path.indexOf("\\build"));
            
            path += URI_WRITE+file;
            Path pathCreate = Paths.get(path);
            if (!Files.exists(pathCreate)) {
                Files.createDirectories(pathCreate);
            }
            //Save images vao thu muc URI_WRITE
            byte[] byteImage = multi.getBytes();
            Path pathImageSave = Paths.get(path + multi.getOriginalFilename());
            Files.write(pathImageSave, byteImage, StandardOpenOption.CREATE);
            //Duong dan image luu o trong db
            uriDBSave = URI_DB+file + multi.getOriginalFilename();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uriDBSave;
    }
}
