/*
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

   3
  7 4
 2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

              75
             95 64
            17 47 82
           18 35 87 10
          20 04 82 47 65
         19 01 23 75 03 34
        88 02 77 73 07 63 67
       99 65 04 28 06 16 70 92
      41 41 26 56 83 40 80 70 33
     41 48 72 33 47 32 37 16 94 29
    53 71 44 65 25 43 91 52 97 51 14
   70 11 33 28 77 73 17 78 39 68 17 57
  91 71 52 38 17 14 91 43 58 50 27 29 48
 63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

Usage: (I did this on a Mac with Mono, on Windows you could just create and run the .exe) mcs Eighteen.cs; mono Eighteen.exe
*/

public class Eighteen {
    private static int[][] TRIANGLE = new int[][] {
        new int[] {75},
        new int[] {95, 64},
        new int[] {17, 47, 82},
        new int[] {18, 35, 87, 10},
        new int[] {20, 04, 82, 47, 65},
        new int[] {19, 01, 23, 75, 03, 34},
        new int[] {88, 02, 77, 73, 07, 63, 67},
        new int[] {99, 65, 04, 28, 06, 16, 70, 92},
        new int[] {41, 41, 26, 56, 83, 40, 80, 70, 33},
        new int[] {41, 48, 72, 33, 47, 32, 37, 16, 94, 29},
        new int[] {53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14},
        new int[] {70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57},
        new int[] {91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48},
        new int[] {63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31},
        new int[] {04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23}
    };

    private int rowSum(int rowNumber) {
        for(int i = 0; i < TRIANGLE[rowNumber].Length; i++) {
            // add the greater of the "left" and "right" numbers below this one to this one
            TRIANGLE[rowNumber][i] += System.Math.Max(TRIANGLE[rowNumber+1][i], TRIANGLE[rowNumber+1][i+1]);
        }

        if(TRIANGLE[rowNumber].Length == 1) {
             // terminate, the top of the triangle is our maximum
             return TRIANGLE[rowNumber][0];
        } else {
             // recurse one row up
             return rowSum(rowNumber - 1);
        }
    }

    public static void Main() {
        Eighteen solver = new Eighteen();
        int sum = solver.rowSum(TRIANGLE.Length -2); // start at the row one above the bottom
        System.Console.WriteLine(sum);
    }
}
