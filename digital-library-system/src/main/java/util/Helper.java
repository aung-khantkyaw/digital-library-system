package util;

public class Helper {
	public static String getLastPartOfURL(String fullURL) {
	    return fullURL.substring(fullURL.lastIndexOf("/") + 1);
	}
	
	public static String getLastPartWithoutExtension(String fullURL) {
        String lastPart = fullURL.substring(fullURL.lastIndexOf("/") + 1);

        if (lastPart.contains(".")) {
            lastPart = lastPart.substring(0, lastPart.lastIndexOf("."));
        }

        return lastPart;
    }
	
	public static String capitalizeFirstLetter(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }

        return input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase();
    }
}
