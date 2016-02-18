public class EulerFour {
    private int findMaxPalindrome(int min, int max) {
        int maxPalindrome = 0;
        for (int i = min; i < max+1; i++) {
            for (int j = i+1; j < max+1; j++) {
                int product = i * j;
                if (product > maxPalindrome && isPalindrome(product)) {
                    maxPalindrome = product;
                }
            }
        }
        return maxPalindrome;
    }

    private boolean isPalindrome(int i) {
        String s = String.valueOf(i);
        StringBuffer sb = new StringBuffer(s);
        return s.equals(sb.reverse().toString());
    }
 
    public static void main(String[] args) {
        EulerFour ef = new EulerFour();
        System.out.println(ef.findMaxPalindrome(100, 999));
    }
}
