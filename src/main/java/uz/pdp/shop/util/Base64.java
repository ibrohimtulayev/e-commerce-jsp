package uz.pdp.shop.util;

public class Base64 {
    public static String encodeBase64(byte[] bytes) {
        return java.util.Base64.getEncoder().encodeToString(bytes);
    }
}
