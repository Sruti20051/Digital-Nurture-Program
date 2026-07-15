public class SearchTest {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Mouse", "Accessories"),
                new Product(103, "Keyboard", "Accessories"),
                new Product(104, "Mobile", "Electronics"),
                new Product(105, "Speaker", "Audio")

        };
        System.out.println("Linear Search");
        Product linearResult = SearchAlgorithms.linearSearch(products, 104);

        if (linearResult != null) {
            System.out.println(linearResult);
        } else {
            System.out.println("Product Not Found");
        }
        System.out.println();
        System.out.println("Binary Search");
        Product binaryResult = SearchAlgorithms.binarySearch(products, 104);
        if (binaryResult != null) {
            System.out.println(binaryResult);
        } else {
            System.out.println("Product Not Found");
        }

    }
}
