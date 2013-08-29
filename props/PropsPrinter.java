import java.util.Properties;
import java.io.IOException;
import java.io.FileInputStream;

class PropsPrinter {
    public static void main(String[] args) {
	if (args.length < 1) {
	    System.err.println("Usage: java PropsPrinter <properties_file>");
	    System.exit(1);
	}
	String path = args[0];
	Properties p = new Properties();
	try {
	    p.load(new FileInputStream(path));
	} catch (IOException e) {
	    e.printStackTrace();
	}
	for (Object k : p.keySet())
	    System.out.println(String.format("%s=%s", k, p.get(k)));
	
    }
}
