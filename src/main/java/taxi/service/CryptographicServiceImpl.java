package taxi.service;

import java.util.Base64;
import taxi.lib.Service;

@Service
public class CryptographicServiceImpl implements CryptographicService {
    private static final String ALL_SYMBOLS_STRING =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxyz0123456789!@#$%^&*()<>?";

    @Override
    public String decode(String input) {
        byte[] decodedBytes = Base64.getDecoder().decode(input.getBytes());
        String[] strings = new String(decodedBytes).split("");
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < strings.length; i++) {
            if (i % 2 != 0) {
                stringBuilder.append(strings[i]);
            }
        }
        return stringBuilder.toString();
    }

    @Override
    public String encode(String input) {
        String[] strings = input.split("");
        StringBuilder stringBuilder = new StringBuilder();
        for (String str : strings) {
            int randomIndex = (int)(ALL_SYMBOLS_STRING.length() * Math.random());
            stringBuilder.append(ALL_SYMBOLS_STRING.charAt(randomIndex)).append(str);
        }
        return Base64.getEncoder().encodeToString(stringBuilder.toString().getBytes());
    }
}
